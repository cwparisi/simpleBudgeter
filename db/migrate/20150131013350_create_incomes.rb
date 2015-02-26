class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :name
      t.float :amount
      t.string :frequency
      t.float :weekly_hours

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
