class PlanetarySystemsController < ApplicationController 

  def index 
    # @planetary_systems = PlanetarySystem.all
    @planetary_systems_most_recent = PlanetarySystem.order(created_at: :desc)
  end

  def show 
    @planetary_system = PlanetarySystem.find(params[:id]) 
  
    @id = @planetary_system.id 
    @light_years_from_earth = @planetary_system.light_years_from_earth
    @star_age = @planetary_system.star_age 
    @metal_rich_star = @planetary_system.metal_rich_star

    @planet_count = @planetary_system.planets.count

  end
end