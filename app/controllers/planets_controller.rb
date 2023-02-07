class PlanetsController < ApplicationController
  def index 
    all_planets = Planet.all
    @planets = all_planets.only_true

    searched_planets = all_planets.search_planet_records(params[:query])
    if !params[:query].nil? 
      @planets = searched_planets
    end
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

  def destroy 
    planet = Planet.find(params[:id])
    planet.destroy 
    redirect_to "/planets"
  end

  private

  def planet_attributes 
    params.permit(:name, :planet_type, :year_discovered, :confirmed, :planetary_system_id)
  end
end