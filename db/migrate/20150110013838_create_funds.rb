class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :name
      t.float :amount
      t.string :color
      t.string :iconUrl

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
