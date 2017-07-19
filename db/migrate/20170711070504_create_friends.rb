class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :description
      t.string :email
      t.string :coverphoto
      t.references :waypoint, index: true, foreign_key: true

      t.timestamps
    end
  end
end
