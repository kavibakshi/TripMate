# app/models/marker.rb
class Marker < ApplicationRecord
  belongs_to :user

  validates :latitude, presence: true
  validates :longitude, presence: true
end
