class CreateMypages < ActiveRecord::Migration[5.0]
  def change
    create_table :mypages do |t|
      t.integer :user_id
      t.string :username
      t.text :introduction
      t.string :img

      t.timestamps
    end
  end
end
