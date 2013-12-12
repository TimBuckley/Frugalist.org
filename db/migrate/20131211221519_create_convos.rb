class CreateConvos < ActiveRecord::Migration
  def change
    create_table :convos do |t|
      t.integer  :shower_user, null: false
      t.integer  :show_user, null: false

      t.timestamps
    end

  end
end
