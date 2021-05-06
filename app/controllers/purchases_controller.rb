class PurchasesController < ApplicationController

  def create
    @offer = Offer.find(params[:offer_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.offer_id = params[:offer_id]
    @purchase.user_id = current_user.id
    authorize @purchase

    if @purchase.save
      @offer.active = false
      @offer.save
      redirect_to dashboard_path
    else
      redirect_to offer_path(@offer)
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:chosen_delivery)
  end

end
