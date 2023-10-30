class CreateItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :itineraries do |t|
      t.string :description
      t.string :location
      t.timestamp :datetime

      t.timestamps
    end
  end
end
