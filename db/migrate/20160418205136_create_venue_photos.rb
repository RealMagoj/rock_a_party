class CreateVenuePhotos < ActiveRecord::Migration
  def change
    create_table :venue_photos do |t|
      t.string :photo
      t.string :venue_id

      t.timestamps null: false
    end
  end
end
