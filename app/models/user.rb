class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :offers
  has_many :purchases

  def average_rating
    Offer.where
    @past_offers = Offer.where(user_id: self.id, active: false)
    @all_ratings = []
    @past_offers.each do |sale|
      (@all_ratings << sale.purchases.first.reviews.first.rating) if (sale.purchases.any? && sale.purchases.first.reviews.any?)
    end
    @average = @all_ratings.inject(0.0) { |sum, el| sum + el } / @all_ratings.size
    if @all_ratings.any?
      return @average
    else
      return "unrated"
    end
  end
end
