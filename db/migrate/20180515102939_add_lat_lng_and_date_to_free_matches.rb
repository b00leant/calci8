class AddLatLngAndDateToFreeMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :free_matches, :latitude, :float
    add_column :free_matches, :longitide, :float
    add_column :free_matches, :date, :datetime
  end
end
