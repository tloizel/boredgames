class Offer < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many_attached :photos

  #before_save :remove_blank_delivery


  validates :game_condition, inclusion: { in: ["As new", "Good condition", "Used", "Poor"] }, presence: true
  validates :delivery_type, presence: true
  validates :language, inclusion: { in: ["English", "Mandarin Chinese", "Hindi", "Spanish", "Standard Arabic", "French", "Russian", "Portuguese","German", "Japanese", "Italian"]}, presence: true
  validates :game_name, presence: { message: " - Please provide the name of the game" }
  validates :description, presence: { message: " - Please describe the game" }
  validates :price, presence: { message: " - Please state how much you want for this game" }
  validates :location, presence: { message: " - Please state where you are located (country, region...)" }

private

  #def remove_blank_delivery
   # delivery_type.gsub(/[\"\\\[\]]/, '').split!(',').reject!(&:blank?).map!(&:strip).join!(',')
  #end

end
