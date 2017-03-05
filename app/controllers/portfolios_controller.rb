class PortfoliosController < ApplicationController

  def index
    @Portfolios = Portfolio.all
  end

  def new
    @Portfolio = Portfolio.new
  end

  def create
    @Portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @Portfolio .save
        format.html { redirect_to portfolios_path , notice: 'Portfolio indewas successfully created.' }
        format.json { render :show, status: :created, location: @Portfolio  }
      else
        format.html { render :new }
        format.json { render json: @Portfolio .errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,:subtitle,:body)
  end
    
end
