class CreateAlbumImages < ActiveRecord::Migration[5.1]
  def change
    create_table :album_images do |t|
      t.string :image
      t.string :description
      t.references :album, index: true, foreign_key: true

      t.timestamps
    end
  end
end
