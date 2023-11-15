class Itinerary < ApplicationRecord
    has_many :expense_trackers, class_name: "ExpenseTracker", dependent: :destroy
end
