require 'rails_helper'

RSpec.describe "Destroy Planet" do 
  describe 'When visiting the planet show page' do 
    it 'has a link to delete the planet and is redirected to the planets index' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      mercury = Planet.create!(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
      venus = Planet.create!(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
      earth = Planet.create!(name: "Earth", planet_type: "Terrestrial", year_discovered: 1543, confirmed: true, planetary_system_id: the_solar_system.id)

      visit "/planets/#{mercury.id}"

      expect(page).to have_link("Delete #{mercury.name}")

      click_link "Delete #{mercury.name}"

      expect(current_path).to eq("/planets")

      expect(page).to have_content("#{venus.name}")
      expect(page).to have_content("#{earth.name}")
      expect(page).to_not have_content(mercury.name)
      expect(Planet.exists?(mercury.id)).to eq(false)
      expect(the_solar_system.planets).to eq([venus, earth])
    end
  end
end