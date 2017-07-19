class Entry < ApplicationRecord
  # ActiveRecord Associations
  belongs_to :waypoint

  # Validations
  validates :title, presence: true, length: { minimum: 2, maximum: 500 }
  validates :description, presence: true, length: { minimum: 2, maximum: 29999 }
  validates :coverphoto, presence: true
end
