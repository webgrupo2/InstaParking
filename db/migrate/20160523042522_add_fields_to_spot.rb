class AddFieldsToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :description, :string
    add_column :spots, :address, :string
  end
end
