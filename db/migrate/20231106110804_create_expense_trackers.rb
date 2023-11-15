class CreateExpenseTrackers < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_trackers do |t|
      t.decimal :total_budget
      t.references :itineraries, null: false, foreign_key: true
      t.decimal :accommodation
      t.decimal :transportation
      t.decimal :meal
      t.decimal :other
      t.decimal :remaining_budget

      t.timestamps
    end
    add_foreign_key :expense_trackers, :itineraries, column: :itineraries_id, primary_key: :id
  end
end
