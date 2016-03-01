class AddColumnToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :void, :boolean, :default => 0
  end
end
