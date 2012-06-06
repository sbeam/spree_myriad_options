module Spree
  class LineItemOptionValue < ActiveRecord::Base
    belongs_to :line_item
    belongs_to :option_value, :class_name => 'Spree::OptionValue'

    # price
    # option.name
    # option.presentation
    # value.name
    # value.presentation
  end
end
