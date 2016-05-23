class CreateAdicionalServices < ActiveRecord::Migration
  def change
    create_table :adicional_services do |t|
      t.string :name
      t.float :cost, :limit => 25

      t.timestamps null: false
    end
  end
end
