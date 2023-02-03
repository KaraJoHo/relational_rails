require 'rails_helper'

RSpec.describe Planet do 
  let(:solar_system) {PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)}

  let(:mars) {Planet.create!(name: "Mars", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: solar_system.id)}
  let(:pluto) {Planet.create(name: "Pluto", planet_type: "Dwarf", year_discovered: 1930, confirmed: false, planetary_system_id: solar_system.id)}
  let(:saturn) {Planet.create(name: "Saturn", planet_type: "Gas Giant", year_discovered: 1610, confirmed: true, planetary_system_id: solar_system.id)}

  describe '#attributes/columns' do 
    it 'has a name, type, year discovered and confirmed' do 
      expect(mars.name).to eq("Mars")
      expect(mars.planet_type).to eq("Terrestrial")
      expect(mars.year_discovered).to eq(1610)
      expect(mars.confirmed).to eq(true)

      expect(mars.planetary_system_id).to eq(solar_system.id)
    end
  end
    it {should belong_to :planetary_system}

  describe '#only_true' do 
    it 'only shows true records' do 
      the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      neptune = Planet.create(name: "Neptune", planet_type: "Ice Giant", year_discovered: 1846, confirmed: true, planetary_system_id: the_solar_system.id)
      pluto = Planet.create(name: "Pluto", planet_type: "Dwarf", year_discovered: 1930, confirmed: false, planetary_system_id: the_solar_system.id)
      mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
#        
      expect(Planet.only_true).to eq([neptune, mercury])
    end
  end
end