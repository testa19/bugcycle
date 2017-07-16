class BicyclesController < ApplicationController
  before_action :set_bicycle, only: [:show]
  
  # GET /products
  # GET /products.json
  def index
    @bicycles = Bicycle.all.page(params[:page]).per(2)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end
  
  private
    def set_bicycle
      @bicycle = Bicycle.find(params[:id])
    end

    def bicycle_params
      params.require(:bicycle).permit(:name, :description)
    end
end

