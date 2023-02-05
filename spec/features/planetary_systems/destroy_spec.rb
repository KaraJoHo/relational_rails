require 'rails_helper'

RSpec.describe 'Destroy Planetary System' do 
  describe 'When visiting the planetary system show page' do 
    it 'has a link to destroy the planetary system, and redirects to index' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)

      mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
      venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)

      tau_ceti_e = Planet.create(name: "Tau Ceti E", planet_type: "Super Earth", year_discovered: 2017, confirmed: true, planetary_system_id: tau_ceti_system.id)

      visit "/planetary_systems/#{the_solar_system.id}" 

      expect(page).to have_link("Delete #{the_solar_system.name}")

      click_link "Delete #{the_solar_system.name}"

      expect(current_path).to eq("/planetary_systems")

      expect(page).to_not have_content("The Solar System") 
      expect(page).to have_content("Tau Ceti")
      expect(Planet.exists?(mercury.id)).to eq(false)
      expect(Planet.exists?(tau_ceti_e.id)).to eq(true)
      expect(PlanetarySystem.exists?(the_solar_system.id)).to eq(false)
    end
  end
end