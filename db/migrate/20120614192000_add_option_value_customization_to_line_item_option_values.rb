class AddOptionValueCustomizationToLineItemOptionValues < ActiveRecord::Migration
  def change
    add_column :spree_line_item_option_values, :option_value_customization, :text
  end
end
