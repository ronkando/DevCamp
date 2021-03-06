class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit , :show , :update , :destroy ]
  layout "portfolio"

  def index
    @portfolio_items = Portfolio.by_position
    # @portfolio_items = Portfolio.ruby_on_rails_portfoio_items
  end
  def sort
  params[:order].each do |key , value|
    Portfolio.find(value[:id]).update(position: value[:position])
  end
    render nothing: true
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build}
  end

  def show

  end

  def create
  @portfolio_item =  Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
    3.times { @portfolio_item.technologies.build}
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
       # format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        #format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

    def destroy
      # do lookup
      @portfolio_item.destroy
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
    3.times { @portfolio_item.technologies.build}
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end
end
