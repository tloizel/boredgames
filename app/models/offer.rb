class Offer < ApplicationRecord
  belongs_to :user

  validates :game_condition, inclusion: { in: ["As new", "Good condition", "Used", "Poor"] }
end
