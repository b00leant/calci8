class CreateUsersFreeMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :users_free_matches, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :free_match, index: true
    end
  end
end
