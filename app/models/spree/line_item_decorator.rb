Spree::LineItem.class_eval do

  has_many :line_item_option_values
  has_many :option_values, :through => :line_item_option_values

  before_save :copy_options_values

  def options
    self.option_values.map { |val| [ val.option_type, val ] }
  end

  def option_types
    puts self.line_item_option_values.inspect
    self.option_values.collect { |val| [val.option_type.name, val.option_type.presentation] }
  end

  def copy_options_values
    self.option_values.each do |val|
      copied_option = self.line_item_option_values.find_by_option_value_id(val.id) || Spree::LineItemOptionValue.new
      copied_option.option_value_name = val.name
      copied_option.option_value_presentation = val.presentation
      copied_option.option_type_name = val.option_type.name
      copied_option.option_type_presentation = val.option_type.presentation
      copied_option.position = val.position
      puts copied_option.inspect
    end
  end

  def copy_price

    self.price = variant.price if variant && price.nil?

    self.option_values.each do |val|
      self.price += val.adder
    end

  end

end
