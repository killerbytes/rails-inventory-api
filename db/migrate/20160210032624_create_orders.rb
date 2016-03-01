class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :transaction_id
      t.decimal :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
