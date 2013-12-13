class CreateConvos < ActiveRecord::Migration
  def change
    create_table :convos do |t|
      t.string   :pairing, null: false

      t.timestamps
    end

  end
end
