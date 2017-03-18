class PortfoliosController < ApplicationController
  before_action :find_portfolio, only: [:edit, :show, :update, :destroy]
  access all: [:show, :index,:angular], user: {except: [:new, :create, :edit ,:toggle_status, :update,:destroy]}, site_admin: :all
  layout "portfolio"

  def index
    @Portfolios = Portfolio.by_position
  end
  
  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def angular
    @Portfolios_angular = Portfolio.angular
  end

  def new
    @Portfolio = Portfolio.new
  end

  def create
    @Portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @Portfolio.save
        format.html { redirect_to portfolios_path , notice: 'Portfolio indewas successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @Portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path , notice: 'Portfolio was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show  
  end

  def destroy
    @Portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
    end
  end


  private

  def portfolio_params
    params.require(:portfolio).permit(
                                      :title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end

  def find_portfolio
    @Portfolio = Portfolio.find(params[:id])
  end
    
end
