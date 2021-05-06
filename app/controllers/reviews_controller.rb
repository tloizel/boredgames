class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @purchase = Purchase.find(params[:purchase_id])
    @offer = Offer.find(params[:offer_id])
    authorize @review
    authorize @purchase
    authorize @offer
  end

  def create
    @review = Review.new(review_params)
    @purchase = Purchase.find(params[:purchase_id])
    @review.purchase = @purchase
    @offer = Offer.find(params[:offer_id])
    authorize @review
    authorize @purchase
    authorize @offer
    if @review.save!
      redirect_to dashboard_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
