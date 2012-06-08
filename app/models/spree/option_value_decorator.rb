Spree::OptionValue.class_eval do
  attr_accessible :adder
  has_many :line_item_option_values
end
