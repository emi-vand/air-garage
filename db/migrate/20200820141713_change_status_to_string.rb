class ChangeStatusToString < ActiveRecord::Migration[6.0]
  def change
    change_column :rentals, :status, :string, default: "Pending"
  end
end
