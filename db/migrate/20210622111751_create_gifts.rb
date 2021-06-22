class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.references :event, null: false, foreign_key: true
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end
