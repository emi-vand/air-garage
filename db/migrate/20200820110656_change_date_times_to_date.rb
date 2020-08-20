class ChangeDateTimesToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :rentals, :pick_up, :date
    change_column :rentals, :drop_off, :date
  end
end
