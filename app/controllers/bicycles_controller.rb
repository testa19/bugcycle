class BicyclesController < InheritedResources::Base
  actions :index, :show
  
  private

    def bicycle_params
      params.require(:bicycle).permit(:name, :description)
    end
end

