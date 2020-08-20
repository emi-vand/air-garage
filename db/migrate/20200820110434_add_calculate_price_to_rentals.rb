class AddCalculatePriceToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :calculated_price, :integer
  end
end
