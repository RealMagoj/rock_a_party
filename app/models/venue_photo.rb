class VenuePhoto < ActiveRecord::Base

  belongs_to :venue

  mount_uploader :photo, ImageUploader

  validates :venue_id,
    presence: true

end