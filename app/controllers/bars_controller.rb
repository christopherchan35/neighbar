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
    @bar = Bar.new(bar_params)
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @bar.neighborhood = @neighborhood
    if @bar.save
      if request.xhr?
        render json: @bar
      else
        redirect_to neighborhood_bar_path(@neighborhood, @bar)
      end
    else
      @errors = @bar.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  private
  def bar_params
    params.require(:bar).permit(:name, :specialty_drink, :cash_only)
  end
end
