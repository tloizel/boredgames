class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @offers1 = Offer.first(4)
    @offers2 = Offer.last(4)
  end
end
