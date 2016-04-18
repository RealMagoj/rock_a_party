class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :logo
      t.string :address
      t.string :phone_number
      t.integer :capacity
      t.integer :avg_drink_price
      t.string :age_range
      t.string :description
      t.string :user_id

      t.timestamps null: false
    end
  end
end
