class CreateTrusts < ActiveRecord::Migration
  def change
    create_table :trusts do |t|
      t.integer  :entrustor_id, null: false
      t.integer  :trustee_id, null: false

      t.timestamps
    end
  end
end
