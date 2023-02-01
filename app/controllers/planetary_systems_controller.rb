class PlanetarySystemsController < ApplicationController 
  def index 
    @planetary_systems = PlanetarySystem.all
  end
end