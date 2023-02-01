class PlanetarySystemPlanetsController < ApplicationController 
  def index 
    @planetary_system = PlanetarySystem.find(params[:planetary_system_id])
    @planets_in_system = @planetary_system.planets
  end
end