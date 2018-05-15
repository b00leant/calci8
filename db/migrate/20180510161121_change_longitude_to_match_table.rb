class ChangeLongitudeToMatchTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :matches, :longitide, :longitude
  end
end
