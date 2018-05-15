class AddLatLngToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :latitude, :float
    add_column :matches, :longitide, :float
  end
end
