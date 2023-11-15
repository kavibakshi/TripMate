class ExpenseTracker < ApplicationRecord
  belongs_to :itinerary, class_name: "Itinerary"
end
