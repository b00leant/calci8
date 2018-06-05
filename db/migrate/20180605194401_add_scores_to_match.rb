class AddScoresToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :host_score, :integer
    add_column :matches, :home_score, :integer
  end
end
