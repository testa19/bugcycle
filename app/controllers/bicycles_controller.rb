class BicyclesController < ApplicationController
  before_action :set_bicycle, only: [:show]

  helper_method :sort_column, :sort_direction, :search_string, :permitted_params, :filter_by_options
  # GET /products
  # GET /products.json
  def index
    bicycles = Bicycle.where('name LIKE ? OR description LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    filtered = bicycles.filter(filtering_params(params)) # optimise search here
    @bicycles = filtered.includes(:pic, :category).order(sort_column + " " + sort_direction).page(params[:page]).per(2)
    @filter_by = [:category_id]

    respond_to :html, :js
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

    def search_string
      params[:search]
    end

    def permitted_params
      params.permit(:sort, :direction, :page, :search, :utf8, category: [], user: [])
    end

    def filtering_params(params)
      # params.slice(:category, :user)
      params.slice(:category)
    end

    def filter_by_options(klass)
      filter = klass.singularize.classify.constantize
      filter.all.map {|c| [c.id, c.name]}    
    end

    def bicycle_params
      params.require(:bicycle).permit(:name, :description)
    end
end

