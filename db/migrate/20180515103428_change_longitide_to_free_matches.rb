class ChangeLongitideToFreeMatches < ActiveRecord::Migration[5.1]
  def change
    rename_column :free_matches, :longitide, :longitude
  end
end
