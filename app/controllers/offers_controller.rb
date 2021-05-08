class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def dashboard
    @my_offers = current_user.offers.where(active: true)
    @my_sales = current_user.offers.where(active: false)
    @my_purchases = current_user.purchases
    authorize @my_offers
    authorize @my_sales
  end 

  def index
    @offers = policy_scope(Offer)#.order(created_at: :desc)
    if params[:search].present?
      @offers = @offers.where("game_name ILIKE ?", "%#{params[:search][:query]}%")
      @searched = params[:search][:query]
    end
    if params[:sort_by_price].present?
      @offers = @offers.order(price: params[:sort_by_price])
    end
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
    @purchase = Purchase.new
    authorize @offer
    @marker = {
      lat: @offer.latitude,
      lng: @offer.longitude
    }
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

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:game_name, :description, :game_condition, :price, :location, :language, delivery_type: [], photos: [])
  end
end
