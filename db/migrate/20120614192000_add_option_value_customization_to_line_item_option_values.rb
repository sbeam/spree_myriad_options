class AddOptionValueCustomizationToLineItemOptionValues < ActiveRecord::Migration
  def change
    add_column :spree_line_item_option_values, :customization, :text
  end
end
