class BicyclesController < InheritedResources::Base
  actions :all, :except => [ :edit, :update, :destroy ]
  
  private

    def bicycle_params
      params.require(:bicycle).permit(:name, :description)
    end
end

