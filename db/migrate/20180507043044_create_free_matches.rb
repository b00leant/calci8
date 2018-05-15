class CreateFreeMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :free_matches do |t|

      t.timestamps
    end
  end
end
