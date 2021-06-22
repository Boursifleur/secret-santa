class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :price
      t.boolean :locked, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
