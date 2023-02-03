class PlanetarySystem < ApplicationRecord 
  has_many :planets

  def planets_ordered_alphabetically 
    self.planets.order(:name)
  end

  def ordered_by(order_pattern)
    if order_pattern.nil?
      self.planets.all
    elsif order_pattern == "alphabetical"
      self.planets_ordered_alphabetically
    end
  end
end