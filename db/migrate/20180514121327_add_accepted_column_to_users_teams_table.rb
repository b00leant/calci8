class AddAcceptedColumnToUsersTeamsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :teams_users, :accepted, :boolean
  end
end
