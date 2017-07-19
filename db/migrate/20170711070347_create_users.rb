class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: true, unique: true
      t.string :description
      t.boolean :admin, default: false
      t.string :profile_pic
      t.string :password_digest
      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_sent_at

      # Geocoder attrs
      t.string :home_country
      t.string :home_state
      t.string :home_city
      t.string :current_country
      t.string :current_state
      t.string :current_city

      t.timestamps
    end
  end
end
