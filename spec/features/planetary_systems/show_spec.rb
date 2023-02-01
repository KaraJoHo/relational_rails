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
  end
end