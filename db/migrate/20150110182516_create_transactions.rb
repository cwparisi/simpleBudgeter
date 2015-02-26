class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :location
      t.float :amount
      t.date :date
      t.string :transactionType
      t.string :description

      t.references :fund, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
