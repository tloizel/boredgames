class ChangeDeliveryTypeInOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :delivery_type, :string
    add_column :offers, :delivery_type, :string, array: true, default: []
  end
end
