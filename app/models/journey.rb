class Journey < ApplicationRecord
  # ActiveRecord Relationships
  belongs_to :user
  has_many :waypoints, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { minimum: 2, maximum: 200 }
  validates :description, presence: true, length: { minimum: 2, maximum: 5000 }
  validates :coverphoto, presence: true
end
