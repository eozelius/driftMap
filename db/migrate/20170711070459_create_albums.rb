class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.references :waypoint, index: true, foreign_key: true

      t.timestamps
    end
  end
end
