class PlantsController < ApplicationController

# GET all plants /plants
def index
    plants = Plant.all
    render json: plants
end

# GET a particular plant /plants/:id
def show
    plant =  Plant.find_by(id: params[:id])
    if plant
        render json: plant
    else
        render json: {error: "Plant not found" }, status: :not_found
    end
end

def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
end
# add strong params conventions
private

def plant_params
    params.permit(:name, :image, :price)
end

end
