class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :type_id
      t.string :notes
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
