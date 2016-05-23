class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.integer :district_id
      t.float :cost, :limit => 25

      t.timestamps null: false
    end
  end
end
