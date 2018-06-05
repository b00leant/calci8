class Match < ApplicationRecord
  resourcify
  NUMBER_OF_PERMITTED_TEAMS = 2
  has_and_belongs_to_many :teams, before_add: :validate_team_limit


  private

  def validate_team_limit(team)
    raise Exception.new if teams.size >= NUMBER_OF_PERMITTED_TEAMS
  end

  after_destroy :delete_dependent_story?

  private

  def delete_match_users
    teams.each do |team|
      team.remove_role :manager, self
      team.destroy
    end
  end
end
