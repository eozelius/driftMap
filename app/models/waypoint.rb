class Waypoint < ApplicationRecord
  # ActiveRecord Relationships
  has_one :album, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :entries, dependent: :destroy
  belongs_to :journey

  # Validations
  validates :title, presence: true, length: { minimum: 2, maximum: 200 }
  validates :description, presence: true, length: { minimum: 2, maximum: 9999 }
  validates :coverphoto, presence: true
  validates :date, presence: true
end
