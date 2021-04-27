class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offers = policy_scope(Offer).order(created_at: :desc)
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  private

  def offer_params
    params.require(:offer).permit(:game_name, :description, :game_condition, :price, :location, :delivery_type, :language, photos: [])
  end
end
