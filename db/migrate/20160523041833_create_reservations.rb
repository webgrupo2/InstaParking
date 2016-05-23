class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer  :user_id
      t.integer  :car_id
      t.integer  :spot_id
      t.datetime :start_hour
      t.datetime :end_hour
      t.string   :status
      t.timestamps null: false
    end
  end
end
