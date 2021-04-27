class Offer < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :game_condition, inclusion: { in: ["As new", "Good condition", "Used", "Poor"] }
end
