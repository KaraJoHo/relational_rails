require 'rails_helper'

RSpec.describe Planet do 
  let(:mars) {Planet.create!(name: "Mars", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true)}
  # let(:solar_system) {PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)}

  describe '#attributes/columns' do 
    it 'has a name, type, year discovered and confirmed' do 
      expect(mars.name).to eq("Mars")
      expect(mars.planet_type).to eq("Terrestrial")
      expect(mars.year_discovered).to eq(1610)
      expect(mars.confirmed).to eq(true)

      #expect(mars.planetary_system_id).to eq(solar_system.id)
    end
    #it {should belong_to :planetary_system}
  end
end