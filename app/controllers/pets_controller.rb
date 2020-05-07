class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def list_shelter_pets_index
    @pet = Shelter.find(params[:shelter_id])
  end
end
