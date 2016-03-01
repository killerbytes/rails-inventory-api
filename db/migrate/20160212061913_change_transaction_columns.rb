class ChangeTransactionColumns < ActiveRecord::Migration
  def change
    change_column :transactions, :type_id, :integer
    remove_column :transaction_types, :type_id
  end
end
