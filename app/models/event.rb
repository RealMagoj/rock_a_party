class Event < ActiveRecord::Base

  belongs_to :venue

  mount_uploader :ad, ImageUploader

  validates :title,
    presence: true,
    uniqueness: true,
    length: {maximum: 40}

  validates :start_date,
    presence: true

  validates :description,
    length: {maximum: 140}

  validates :venue_id,
    presence: true
    
end