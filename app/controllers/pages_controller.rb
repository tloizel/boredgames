class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @offers = Offer.all.shuffle
  end

end
