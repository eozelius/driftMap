class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :description
      t.string :coverphoto
      t.references :waypoint, index: true, foreign_key: true

      t.timestamps
    end
  end
end
