class PlanetarySystemsController < ApplicationController 

  def index 
    @planetary_systems = PlanetarySystem.order_by_created_at
    #  @planetary_systems = PlanetarySystem.all
    # @planetary_systems = PlanetarySystem.order(created_at: :desc)
  end

  def show 
    @planetary_system = PlanetarySystem.find(params[:id]) 
    @planet_count = @planetary_system.system_planet_count
  end

  def new 

  end

  def create 
    @planetary_system = PlanetarySystem.create(planetary_attributes)
    redirect_to '/planetary_systems'
  end

  def edit 
    @planetary_system = PlanetarySystem.find(params[:planetary_system_id])
  end

  def update 
    @planetary_system = PlanetarySystem.find(params[:planetary_system_id])
    @planetary_system.update(planetary_attributes)
    redirect_to "/planetary_systems/#{@planetary_system.id}"
  end

  def destroy 
    planetary_system = PlanetarySystem.find(params[:id])
    planetary_system.destroy
    redirect_to "/planetary_systems"
  end

  def planetary_attributes 
    params.permit(:name, :light_years_from_earth, :star_age, :metal_rich_star)
  end
end