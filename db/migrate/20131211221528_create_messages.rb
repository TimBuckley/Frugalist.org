class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer  :convo_id, null: false
      t.integer  :author_id, null: false
      t.integer  :recipient_id, null: false
      t.text     :body

      t.timestamps
    end
  end
end
