class BicyclesController < InheritedResources::Base

  private

    def bicycle_params
      params.require(:bicycle).permit(:name, :description)
    end
end

