class AddLineItemOptionValuesTable < ActiveRecord::Migration
  def up
    create_table 'spree_line_item_option_values' do |t|
      t.integer       "line_item_id", :null => false
      t.integer       "option_value_id", :null => false
    end
    add_index :spree_line_item_option_values, :line_item_id
    add_index :spree_line_item_option_values, :option_value_id
  end

  def down
    drop_table 'spree_line_item_option_values'
  end
end
