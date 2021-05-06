class Offer < ApplicationRecord
  DELIVERY_TYPES = ["In person", "Colissimo", "Point Relay"]

  belongs_to :user
  has_many :purchases
  has_many_attached :photos

  validates :game_condition, inclusion: { in: ["As new", "Good condition", "Used", "Poor"] }, presence: true
  validates :delivery_type, presence: true
  validates :language, inclusion: { in: ["French", "English", "Mandarin Chinese", "Hindi", "Spanish", "Standard Arabic", "Russian", "Portuguese","German", "Japanese", "Italian"]}, presence: true
  validates :game_name, presence: { message: " - Please provide the name of the game" }
  validates :description, presence: { message: " - Please describe the game" }
  validates :price, presence: { message: " - Please state how much you want for this game" }
  validates :location, presence: { message: " - Please state where you are located (country, region...)" }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
