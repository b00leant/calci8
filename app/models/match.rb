class Match < ApplicationRecord
  resourcify
  NUMBER_OF_PERMITTED_TEAMS = 2
  has_and_belongs_to_many :teams, before_add: :validate_team_limit

  private

  def validate_team_limit(team)
    raise Exception.new if teams.size >= NUMBER_OF_PERMITTED_TEAMS
  end
end
