class ChangeTransactionReferenceToPurchaseReferenceinReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :transaction_id
    add_reference :reviews, :purchase, index: true, foreign_key: true
  end
end
