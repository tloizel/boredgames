class ChangeColumnActiveInOffers < ActiveRecord::Migration[6.0]
  def change
    change_column :offers, :active, :boolean, :default => true
  end
end
