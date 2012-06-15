module Spree
  class LineItemOptionValue < ActiveRecord::Base
    belongs_to :line_item
    belongs_to :option_value, :class_name => 'Spree::OptionValue'

    before_save :snapshot_option_values

    serialize :customization

    def snapshot_option_values
      if option_value
        self.adder = option_value.adder
        self.value_name = option_value.name
        self.value_presentation = option_value.presentation
        self.type_name = option_value.option_type.name
        self.type_presentation = option_value.option_type.presentation
      end
    end

  end
end
