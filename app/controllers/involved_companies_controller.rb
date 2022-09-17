class InvolvedCompaniesController < ApplicationController
  # POST games/:game_id/involved_companies
  def create
    @involved_company = InvolvedCompany.where(game_id: params[:game_id]).where(company_id: involved_company_params[:company_id]).first
    @game = Game.find(params[:game_id])
    if @involved_company
      if involved_company_params[:developer]
        if @involved_company.developer
          @involved_company = InvolvedCompany.new(involved_company_params)
          @involved_company.game = @game
          @involved_company_dev = @involved_company
          @involved_company_dev.valid?
          @involved_company_pub = InvolvedCompany.new
        else
          @involved_company.developer = true
        end
      else
        if @involved_company.publisher
          @involved_company = InvolvedCompany.new(involved_company_params)
          @involved_company.game = @game
          @involved_company_pub = @involved_company
          @involved_company_pub.valid?
          @involved_company_dev = InvolvedCompany.new
        else
          @involved_company.publisher = true
        end
      end
    else
      if involved_company_params[:developer]
        @involved_company_dev = InvolvedCompany.new(involved_company_params)
        @involved_company_dev.valid?
        @involved_company = @involved_company_dev
        @involved_company_pub = InvolvedCompany.new
      else
        @involved_company_pub = InvolvedCompany.new(involved_company_params)
        @involved_company_pub.valid?
        @involved_company = @involved_company_pub
        @involved_company_dev = InvolvedCompany.new
      end
      @involved_company.game = @game
    end
    if @involved_company.save
      redirect_to @game, notice: "Company added"
    else
      render "games/show", status: :unprocessable_entity
    end
  end

  private

  def involved_company_params
    params.require(:involved_company).permit(:company_id, :developer, :publisher)
  end
end
