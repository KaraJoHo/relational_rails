class PlanetarySystem < ApplicationRecord 
  has_many :planets

  def planets_ordered_alphabetically 
    self.planets.order(:name)
  end
end