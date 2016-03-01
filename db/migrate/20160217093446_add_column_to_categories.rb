class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :active, :boolean, :default => 1
    add_column :categories, :order, :integer
  end
end
