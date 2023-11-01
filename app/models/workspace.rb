class Workspace < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  has_many :lists, dependent: :destroy

  { public_visibility: 0, private_visibility: 1 }
end
