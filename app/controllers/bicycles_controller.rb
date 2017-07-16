class BicyclesController < ApplicationController
  before_action :set_bicycle, only: [:show]
  helper_method :sort_column, :sort_direction, :permitted_params
  # GET /products
  # GET /products.json
  def index
    bicycles = Bicycle.where('name LIKE ? OR description LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    @bicycles = bicycles.order(sort_column + " " + sort_direction).page(params[:page]).per(2)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end
  
  private
    def set_bicycle
      @bicycle = Bicycle.find(params[:id])
    end

    def sort_column
      Bicycle.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def permitted_params
      params.permit(:sort, :direction, :page, :search, :utf8)
    end

    def bicycle_params
      params.require(:bicycle).permit(:name, :description)
    end
end

