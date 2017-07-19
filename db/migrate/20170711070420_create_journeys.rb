class CreateJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :journeys do |t|
      t.string :title
      t.string :description
      t.string :coverphoto
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
