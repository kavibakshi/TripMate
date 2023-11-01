json.extract! itinerary, :id, :description, :location, :datetime, :created_at, :updated_at
json.url itinerary_url(itinerary, format: :json)
