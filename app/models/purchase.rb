class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :reviews, dependent: :destroy

  validates :chosen_delivery, presence: true
end
