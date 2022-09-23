class CriticsController < ApplicationController
  # POST game/:game_id/critic
  # POST company/:company_id/critic
  def create
    @involved_company_dev = InvolvedCompany.new
    @involved_company_pub = InvolvedCompany.new

    if params[:game_id]
      @criticable = Game.find(params[:game_id])
      @game = Game.find(params[:game_id])
    elsif params[:company_id]
      @criticable = Company.find(params[:company_id])
      @company = Company.find(params[:company_id])
    end

    @critic = @criticable.critics.new(critic_params)

    if @critic.save
      redirect_to @criticable, notice: "Critic was successfully created."
    elsif params[:game_id]
      render "games/show", status: :unprocessable_entity
    elsif params[:company_id]
      render "companies/show", status: :unprocessable_entity
    end
  end

  def destroy
    @critic = Critic.find(params[:id])
    redirect_to @critic.criticable,  notice: "Critic was successfully destroyed."
  end

  private

  def critic_params
    params.require(:critic).permit(:title, :body, :user_id)
  end
end
