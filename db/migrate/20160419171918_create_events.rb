class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :ad
      t.string :description
      t.string :venue_id

      t.timestamps null: false
    end
  end
end
