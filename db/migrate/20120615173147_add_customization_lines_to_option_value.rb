class AddCustomizationLinesToOptionValue < ActiveRecord::Migration
  def change
    add_column :spree_option_values, :customization_lines, :integer
  end
end
