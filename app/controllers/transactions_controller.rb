class TransactionsController < ApplicationController

  def create
    @offer = Offer.find(params[:offer_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.offer_id = params[:offer_id]
    @transaction.user_id = current_user.id
    authorize @transaction

    if @transaction.save
      @offer.active = false
      @offer.save
      redirect_to dashboard_path
    else
      redirect_to offer_path(@offer)
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:chosen_delivery)
  end

end
