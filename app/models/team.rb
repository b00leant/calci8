class Team < ApplicationRecord
  resourcify
  rolify :role_cname => 'TeamRole'
  has_and_belongs_to_many :users
  has_and_belongs_to_many :matches

end
