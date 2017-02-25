class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :status
      t.references :user_id, index: true
      t.references :friend, index: true

      t.timestamps null: false
    end
    add_foreign_key :friends, :users
    add_foreign_key :friends, :friends
  end
end
