class ChangeColumnTransactions < ActiveRecord::Migration
  def change
    change_column :transactions, :type_id, :string
    add_column :transaction_types, :type_id, :string
  end
end
