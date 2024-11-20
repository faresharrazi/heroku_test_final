class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.string :title
      t.decimal :amount
      t.string :category
      t.date :date

      t.timestamps
    end
  end
end
