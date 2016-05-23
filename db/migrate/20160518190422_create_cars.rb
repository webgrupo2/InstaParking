class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :plate

      t.timestamps null: false
    end
  end
end
