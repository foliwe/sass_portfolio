class PortfoliosController < ApplicationController
  before_action :find_portfolio, except: [:index, :new, :create]

  def index
    @Portfolios = Portfolio.all
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


  private

  def portfolio_params
    params.require(:portfolio).permit(:title,:subtitle,:body)
  end

  def find_portfolio
    @Portfolio = Portfolio.find(params[:id])
  end
    
end
