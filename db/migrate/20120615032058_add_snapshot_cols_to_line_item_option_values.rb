class AddSnapshotColsToLineItemOptionValues < ActiveRecord::Migration
  def change
    add_column :spree_line_item_option_values, :type_name, :string,         :limit => 100
    add_column :spree_line_item_option_values, :type_presentation, :string,         :limit => 100
    add_column :spree_line_item_option_values, :value_name, :string
    add_column :spree_line_item_option_values, :value_presentation, :string
  end
end
