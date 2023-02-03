class PlanetsController < ApplicationController
  def index 
    @planets = Planet.all
  end

  def show 
    @planet = Planet.find(params[:id])
  end

  def edit 
    @planet = Planet.find(params[:id])
  end

  def update
    planet = Planet.find(params[:id])
    planet.update(planet_attributes)

    redirect_to "/planets/#{planet.id}"
  end

  def planet_attributes 
    params.permit(:name, :planet_type, :year_discovered, :confirmed, :planetary_system_id)
  end
end