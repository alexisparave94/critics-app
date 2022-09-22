class CriticsController < ApplicationController
  # POST game/:game_id/critic
  def create
    @game = Game.find(params[:game_id])
    @involved_company_dev = InvolvedCompany.new
    @involved_company_pub = InvolvedCompany.new
    @critic = Critic.new(critic_params)
    @critic.criticable = @game
    if @critic.save
      redirect_to @game, notice: "Critic was successfully created."
    else
      render "games/show", status: :unprocessable_entity
    end
  end

  private

  def critic_params
    params.require(:critic).permit(:title, :body, :user_id)
  end
end
