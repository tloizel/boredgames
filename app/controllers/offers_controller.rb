class OffersController < ApplicationController

  def new
    @offer = Offer.new
    @current_user = User.find_by(id: session[:user_id])
  end

  def create
    @offer = Offer.new(offer_params)
    @current_user = User.find_by(id: session[:user_id])
    @offer.user_id = @current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end
  
  private

  def offer_params
    params.require(:offer).permit(:game_name, :description, :game_condition, :price, :location, :delivery_type, :language) 
  end
end
