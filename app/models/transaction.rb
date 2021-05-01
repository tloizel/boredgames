class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :chosen_delivery, presence: true
end
