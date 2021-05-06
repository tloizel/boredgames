class RemoveRatingFromTransaction < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :rating, :integer
  end
end
