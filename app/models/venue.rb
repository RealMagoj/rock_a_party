class Venue < ActiveRecord::Base

  belongs_to :user
  has_many :venue_photos, dependent: :destroy
  has_many :events, dependent: :destroy

  mount_uploader :logo, ImageUploader

  validates :name,
    presence: true,
    uniqueness: true
  
  validates :logo,
    presence: true

  validates :address,
    presence: true,
    uniqueness: true

  validates :phone_number,
    presence: true,
    uniqueness: true

  validates :capacity,
    presence: true

  validates :avg_drink_price,
    presence: true

  validates :age_range,
    presence: true

  validates :description,
    length: {maximum: 140}

  validates :user_id,
    presence: true

end