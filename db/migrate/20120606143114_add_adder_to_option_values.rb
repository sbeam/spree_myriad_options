class AddAdderToOptionValues < ActiveRecord::Migration
  def change
    add_column :spree_option_values, :adder, :decimal, { :precision => 8, :scale => 2, :null => false, :default => 0 }
  end
end
