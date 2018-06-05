class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /matches/1/set_score
  def set_score
    @match = Match.find(params[:id])
    if Match.find(params[:id]).date.past? == false
      redirect_to match_path(Match.find(params[:id])), notice: 'Il match non è ancora finito!'
    end
    @match.teams.each do |team|
      if(team.has_role?(:manager, @match))
        @home_team = team
      else
        @host_team = team
      end
    end
  end

  # POST
  def update_score
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    if(@match.teams.count >0)
      @match.teams.each do |team|
        team.users.each do |user|
          if(user.id == current_user.id)
            @user_team = Team.find(team.id)
          end
        end
      end
      @match.teams.each do |team|
        if(team.has_role?(:manager, @match))
          @home_team = team
        else
          @host_team = team
        end
      end
    end
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create

    @match = Match.new(match_params)

    # Quando creo un primo match senza assegnarlo ad una squadrea in casa e ospite assegno un ruolo temporaneo all'utente che lo crea

    respond_to do |format|
      if @match.save
        @home_team = Team.where(name: params[:home]).first
        @host_team = Team.where(name: params[:host]).first
        @home_team.add_role(:manager, @match)
        @match.teams << @host_team
        @match.teams << @home_team
        current_user.add_role(:manager, @match)
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:date, :latitude, :longitude, :host, :home, :host_score, :home_score)
      #params.fetch(:match, {})
    end
end
