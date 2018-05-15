class ChangeUsersFreeMatchesToFreeMatchesUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :users_free_matches, :free_matches_users
  end
end
