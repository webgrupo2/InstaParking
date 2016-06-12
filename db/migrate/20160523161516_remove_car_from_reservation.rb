class RemoveCarFromReservation < ActiveRecord::Migration
  def change
    remove_column :reservations, :car_id, :integer
  end
end
