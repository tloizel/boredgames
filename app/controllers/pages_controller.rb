class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @offer_first = Offer.first(4)
    @offers = @offer_first.shuffle
    @other_offers = @offer_first.shuffle
  end

end
