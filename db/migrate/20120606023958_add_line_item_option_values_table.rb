class AddLineItemOptionValuesTable < ActiveRecord::Migration
  def up
    create_table 'spree_line_item_option_values' do |t|
      t.integer       "line_item_id", :null => false
      t.integer       "option_type_id", :null => false
      t.integer       "option_value_id", :null => false
      t.string        "option_type_name",         :limit => 100
      t.string        "option_type_presentation", :limit => 100
      t.integer       "position"
      t.string        "option_value_name"
      t.string        "option_value_presentation"
      t.timestamps
    end
    add_index :spree_line_item_option_values, :line_item_id
    add_index :spree_line_item_option_values, :option_type_id
    add_index :spree_line_item_option_values, :option_value_id
  end

  def down
    drop_table 'spree_line_item_options_values'
  end
end
