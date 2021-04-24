class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :game_name
      t.text :description
      t.string :game_condition
      t.float :price
      t.string :location
      t.string :delivery_type
      t.string :language
      t.boolean :active

      t.timestamps
    end
  end
end
