class ChangeReadAdColumnToNotification < ActiveRecord::Migration[5.1]
  def change
    rename_column :notifications, :read_ad, :read_at
  end
end
