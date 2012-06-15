Spree::LineItem.class_eval do

  has_many :line_item_option_values, :dependent => :destroy
  has_many :option_values, :through => :line_item_option_values

  alias_method :options, :line_item_option_values

  def has_options?
    self.option_values.length > 0
  end

  def copy_price
    self.price = variant.price if variant && price.nil?

    self.option_values.each do |val|
      self.price += val.adder
    end
  end

  def customizations= params
    params.each do |option_value_name, val|
      if option = self.options.find_by_value_name(option_value_name)
        option.customization = val
        option.save
      end
    end
  end

  def customizations
    self.options.each_with_object({}) { |opt, h| h[opt.value_name] = opt.customization unless opt.customization.blank? }
  end

end
