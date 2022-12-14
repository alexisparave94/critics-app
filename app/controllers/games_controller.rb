class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy add_genre remove_genre add_platform remove_platform]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
    @involved_company_dev = InvolvedCompany.new
    @involved_company_pub = InvolvedCompany.new
    @critic = Critic.new
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path, notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to games_path, notice: "Game was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: "Game was successfully destroyed."
  end

  def add_genre
    @genre = Genre.find(params[:genre_id])
    @game.genres << @genre
    redirect_to @game
  end

  def remove_genre
    @genre = Genre.find(params[:genre_id])
    @game.genres.delete(@genre)
    redirect_to @game
  end

  def add_platform
    @platform = Platform.find(params[:platform_id])
    @game.platforms << @platform
    redirect_to @game
  end

  def remove_platform
    @platform = Platform.find(params[:platform_id])
    @game.platforms.delete(@platform)
    redirect_to @game
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id, :cover)
  end
end
