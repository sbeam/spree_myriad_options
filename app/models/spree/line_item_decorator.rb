Spree::LineItem.class_eval do

  has_many :line_item_option_values
  has_many :option_values, :through => :line_item_option_values

  def options
    self.option_values.map { |val| [ val.option_type, val ] }
  end

  def copy_price

    self.price = variant.price if variant && price.nil?

    self.option_values.each do |val|
      self.price += val.adder
    end

  end

end
