class AddDateToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :date, :datetime
  end
end
