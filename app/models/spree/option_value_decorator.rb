Spree::OptionValue.class_eval do
  attr_accessible :adder, :customization_lines
  has_many :line_item_option_values
end
