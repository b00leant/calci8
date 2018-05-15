class ChangeTeansMatchesTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :teams_matches, :matches_teams
  end
end
