class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
