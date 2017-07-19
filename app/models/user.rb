class User < ApplicationRecord
  # ActiveRecord Relationships
  has_one :globe, dependent: :destroy
  has_many :journeys, dependent: :destroy

  # Accessors
  attr_accessor :latitude, :longitude, :remember_token, :password_reset_token

  # Validations
  validates :first_name,  presence: true, :length => { minimum: 2, maximum: 55 }
  validates :last_name,   presence: true, :length => { minimum: 2, maximum: 55 }
  validates :email,       presence: true, :length => { minimum: 7, maximum: 255 }, :format => { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :password,    presence: true, length: { minimum: 6 }, allow_nil: true
  validates :globe,       presence: true

  # Callbacks
  before_save :downcase_email
  after_validation :geocode # if :home_location.changed? || :current_location.changed?

  # Geocoder
  geocoded_by :home_location
  geocoded_by :current_location

  # Password
  has_secure_password

  # Profile Picture CarrierWave Uploader
  # mount_uploader :profile_pic, PictureUploader

  # Methods

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # generates new token that can be used to. cookies & tokens.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def create_password_reset_digest
    self.password_reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(password_reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

  def home_location
    "#{self.home_city} #{self.home_state} #{self.home_country}"
  end

  def current_location
    "#{self.current_city} #{self.current_state} #{self.home_country} "
  end

  def downcase_email
    self.email = email.downcase
  end
end
