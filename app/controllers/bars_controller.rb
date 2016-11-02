class BarsController < ApplicationController
  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    # @bars = Bar.where(neighborhood_id: @neighborhood.id)
    @bars = @neighborhood.bars
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @bar = Bar.new
  end

  def edit
  end

  def create
    @bar.new(bar_params)
    @neighborhood = Neighborhood.find(params[:neighborhood_id])

    if @bar.save
      
    end
  end

  def update
  end

  private
  def bar_params
    params.require(:bar).permit(:name, :speciality_drink, :cash_only)
  end
end
