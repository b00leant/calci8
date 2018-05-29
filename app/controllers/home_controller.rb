class HomeController < ApplicationController
  def index
    @teams = Team.all
    @matches = Match.all
    @free_matches = FreeMatch.all
    @collection = (Match.all + Team.all + FreeMatch.all).sort_by &:created_at
    @notifications = Notification.all
  end
end
