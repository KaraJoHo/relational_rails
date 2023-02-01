require 'rails_helper'

RSpec.describe 'Planetary Systems Show Page' do 
  describe 'show page' do 
    it 'can visit a path to a specific parent via the id and display the id and attributes' do 
    
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)

      visit "/planetary_systems/#{the_solar_system.id}"

      expect(page).to have_content(the_solar_system.name)
      expect(page).to have_content(the_solar_system.id)
      expect(page).to have_content(the_solar_system.light_years_from_earth)
      expect(page).to have_content(the_solar_system.star_age)
      expect(page).to have_content(the_solar_system.metal_rich_star)
    end

    it 'displays the number of children associated with the planetary system' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)

      mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
      venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
      earth = Planet.create(name: "Earth", planet_type: "Terrestrial", year_discovered: 1543, confirmed: true, planetary_system_id: the_solar_system.id)

      visit "/planetary_systems/#{the_solar_system.id}"

      expect(page).to have_content(the_solar_system.name)
      expect(page).to have_content(the_solar_system.id)
      expect(page).to have_content(the_solar_system.light_years_from_earth)
      expect(page).to have_content(the_solar_system.star_age)
      expect(page).to have_content(the_solar_system.metal_rich_star)

      expect(page).to have_content(the_solar_system.planets.count)
      expect(page).to have_content("Current Number of Planets in #{the_solar_system.name}: #{the_solar_system.planets.count}")
    end
  end
end