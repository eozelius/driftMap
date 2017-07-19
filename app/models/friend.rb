class Friend < ApplicationRecord
  # ActiveRecord Associations
  belongs_to :waypoint

  # Validations
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { minimum: 2, maximum: 9999 }
end
