class CreateExpenseTrackers < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_trackers do |t|
      t.decimal :total_budget
      t.integer :itinerary_id
      t.string :itinerary_description
      t.decimal :accommodation
      t.decimal :transportation
      t.decimal :meal
      t.decimal :other

      t.timestamps
    end
  end
end
