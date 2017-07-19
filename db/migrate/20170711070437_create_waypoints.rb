class CreateWaypoints < ActiveRecord::Migration[5.1]
  def change
    create_table :waypoints do |t|
      t.string :title
      t.string :description
      t.string :coverphoto
      t.datetime :date
      t.references :journey, index: true, foreign_key: true

      t.timestamps
    end
  end
end
