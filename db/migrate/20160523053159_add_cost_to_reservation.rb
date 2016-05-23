class AddCostToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :final_cost, :float, :limit => 25
  end
end
