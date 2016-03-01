class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.decimal :price
      t.boolean :active
      t.integer :inventory_id
      t.integer :item
      t.boolean :set

      t.timestamps null: false
    end
  end
end
