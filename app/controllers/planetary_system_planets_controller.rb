class PlanetarySystemPlanetsController < ApplicationController 
  def index 
    @planetary_system = PlanetarySystem.find(params[:planetary_system_id])
    @planets_in_system = @planetary_system.ordered_by(params[:order])
  end

  def new 
    @planetary_system = PlanetarySystem.find(params[:planetary_system_id])
  end

  def create
    @planetary_system = PlanetarySystem.find(params[:planetary_system_id])
    @planetary_system.planets.create(planet_attributes)
    redirect_to "/planetary_systems/#{@planetary_system.id}/planets"
  end

  private

  def planet_attributes 
    params.permit(:name, :planet_type, :year_discovered, :confirmed, :planetary_system_id)
  end
end