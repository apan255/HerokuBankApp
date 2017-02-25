class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :type
      t.string :status
      t.references :trans_from, index: true
      t.references :trans_to, index: true
      t.date :start_date
      t.date :end_date
      t.integer :from_account
      t.integer :to_account

      t.timestamps null: false
    end
    add_foreign_key :transactions, :trans_froms
    add_foreign_key :transactions, :trans_tos
  end
end
