class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
    @user = current_user
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    @matches = @team.matches
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  def add_player
    @team = Team.find(params[:id])
    if Notification.where(recipient: current_user, notifiable: @team).present?
      @team.users << current_user
      current_user.add_role :player, @team
      redirect_to team_path(@team)
    end
  end

  def select_new_players
    @team = Team.find(params[:id])
    if !current_user.has_role?(:manager, @team)
      return redirect_to("/teams")
    end
  end
  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
    if !current_user.has_role?(:manager, @team)
      return redirect_to("/teams")
    end
  end

  def edit_players_roles
    @team = Team.find(params[:id])
    @users = @team.users
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @user = current_user
    respond_to do |format|
      if @team.save
        @user.add_role :manager, @team
        current_user.teams << @team
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def invite
    @team = Team.find(params[:id])
    if user_signed_in? && current_user.has_role?(:manager, @team)
      params[:player_to_add].each do |email|
        user = User.where(email: email).first
        if user.present?
          recipient = user
          team = Team.find(params[:id])
          Notification.create(recipient: recipient, actor: current_user, action: "invited",notifiable: team)
        end
      end
      respond_to do |format|
        if @team.update(team_params)
          format.html { redirect_to @team, notice: 'Inviti spediti!' }
          format.json { render :show, status: :ok, location: @team }
        else
          format.html { render :edit }
          format.json { render json: @team.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.fetch(:team, {}).permit(:name)
    end
    def team_params_with_name
      params.require(:team).permit(:name)
    end
    def team_params_with_players
      params.require(:team).permit(:name,:player_to_add)
    end
end
