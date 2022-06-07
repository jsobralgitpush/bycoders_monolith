class ChangeAmouhtName < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :amount, :amount
  end
end
