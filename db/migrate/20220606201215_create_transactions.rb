class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type
      t.string :date
      t.float :amouht
      t.string :taxpayer_id
      t.string :card_used
      t.string :time
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
