class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.text :name
      t.text :introduction
      t.integer :price
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
