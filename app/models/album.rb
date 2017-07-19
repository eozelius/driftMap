class Album < ApplicationRecord
  # ActiveRecord Associations
  belongs_to :waypoint
  has_many :album_images, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { minimum: 2, maximum: 200 }
  validates :description, presence: true, length: { minimum: 2, maximum: 5000 }
end
