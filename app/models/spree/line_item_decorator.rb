Spree::LineItem.class_eval do

  has_many :line_item_option_values, :dependent => :destroy
  has_many :option_values, :through => :line_item_option_values

  def has_options?
    self.option_values.length > 0
  end

  def copy_price
    self.price = variant.price if variant && price.nil?

    self.option_values.each do |val|
      self.price += val.adder
    end
  end

  alias_method :options, :line_item_option_values

end
