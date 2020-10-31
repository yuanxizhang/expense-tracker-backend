class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :amount, null: false
      t.string :kind, null: false
      t.string :date, null: false
      t.string :description
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
