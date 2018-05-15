class FreeMatchesController < ApplicationController
  before_action :set_free_match, only: [:show, :edit, :update, :destroy]

  # GET /free_matches
  # GET /free_matches.json
  def index
    @free_matches = FreeMatch.all
    @user = current_user
  end

  # GET /free_matches/1
  # GET /free_matches/1.json
  def show
    @free_match = FreeMatch.find(params[:id])
  end

  # GET /free_matches/new
  def new
    @free_match = FreeMatch.new
  end

  # GET /free_matches/1/edit
  def edit
    @free_match = FreeMatch.find(params[:id])
    if !current_user.has_role?(:manager, @free_match)
      return redirect_to("/free_matches")
    end
  end

  # POST /free_matches
  # POST /free_matches.json
  def create
    @free_match = FreeMatch.new(free_match_params)
    @user = current_user
    respond_to do |format|
      if @free_match.save
        current_user.free_matches << @free_match
        @user.add_role :manager, @free_match
        params[:player_to_add].each do |email|
          user = User.where(email: email)
          if user.present?
            @free_match.users << user
            #user.add_role :player, @free_match
          end
        end
        current_user.add_role(:manager, @match)
        format.html { redirect_to @free_match, notice: 'Free match was successfully created.' }
        format.json { render :show, status: :created, location: @free_match }
      else
        format.html { render :new }
        format.json { render json: @free_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /free_matches/1
  # PATCH/PUT /free_matches/1.json
  def update
    respond_to do |format|
      if @free_match.update(free_match_params)
        format.html { redirect_to @free_match, notice: 'Free match was successfully updated.' }
        format.json { render :show, status: :ok, location: @free_match }
      else
        format.html { render :edit }
        format.json { render json: @free_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /free_matches/1
  # DELETE /free_matches/1.json
  def destroy
    @free_match.destroy
    respond_to do |format|
      format.html { redirect_to free_matches_url, notice: 'Free match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_free_match
      @free_match = FreeMatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def free_match_params
      #params.fetch(:free_match, {})
      params.require(:free_match).permit(:date, :latitude, :longitude, :player_to_add)
    end
end
