class AddNameToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :name, :string
  end
end
