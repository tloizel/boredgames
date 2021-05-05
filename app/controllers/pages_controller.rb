class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @all_offers = Offer.all.shuffle
    @offers = @all_offers.first(3)
  end

end
