class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def dashboard
    @my_offers = current_user.offers.where(active: true)
    @my_sales = current_user.offers.where(active: false)
    @my_transactions = current_user.transactions
    authorize @my_offers
    authorize @my_sales
  end

  def filter
    @offers = Offer.all
    @filtered_offer_by_price = @offers.price.sort
  end


  def index
    if params[:search].present?
      @offers = policy_scope(Offer).where("game_name ILIKE ?", "%#{params[:search][:query]}%")
      @searched = params[:search][:query]
    else
      @offers = policy_scope(Offer).order(created_at: :desc)
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
    @delivery_options = @offer.delivery_type.gsub(/[\"\\\[\]]/, '').split(',').reject(&:blank?).map(&:strip)
    @transaction = Transaction.new
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
