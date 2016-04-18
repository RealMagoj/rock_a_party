class VenuePhoto < ActiveRecord::Base

  belongs_to :venue

  mount_uploader :photo, ImageUploader

end