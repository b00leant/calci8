class DropNotificationsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :notifications
    drop_table :subscriptions
  end
end
