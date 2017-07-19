class CreateGlobes < ActiveRecord::Migration[5.1]
  def change
    create_table :globes do |t|
      t.float :lat
      t.float :lng
      t.integer :zoom
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
