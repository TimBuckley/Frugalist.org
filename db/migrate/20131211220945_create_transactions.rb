class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer  :user_id, null: false
      t.string   :description, null: false
      t.float  :amount, null: false, scale: 2
      t.string   :category
      t.string   :privacy
      t.string   :date, null: false

      t.timestamps
    end
  end
end
