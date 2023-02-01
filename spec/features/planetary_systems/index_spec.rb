require 'rails_helper' 

RSpec.describe 'Planetary System Index Page' do 

   describe 'planetary system index' do 
    it 'displays the name of each parent record in the system' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
       
      visit "/planetary_systems"

      expect(page).to have_content(the_solar_system.name)
      expect(page).to have_content(tau_ceti_system.name)
    end

    it 'order records by most recently created first' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
      kepler_11_system = PlanetarySystem.create!(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)
      
      visit "/planetary_systems"

      expect(page).to have_content(the_solar_system.name)
      expect(page).to have_content(tau_ceti_system.name)
      expect(page).to have_content(kepler_11_system.name)

      expect(kepler_11_system.name).to appear_before(tau_ceti_system.name)
      expect(tau_ceti_system.name).to appear_before(the_solar_system.name)
    end

    it 'displays the records created at attribute' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
      kepler_11_system = PlanetarySystem.create!(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)
      
      visit "/planetary_systems"

      expect(page).to have_content(the_solar_system.name)
      expect(page).to have_content(tau_ceti_system.name)
      expect(page).to have_content(kepler_11_system.name)

      expect(kepler_11_system.name).to appear_before(tau_ceti_system.name)
      expect(tau_ceti_system.name).to appear_before(the_solar_system.name)

      expect(page).to have_content(the_solar_system.created_at)
      expect(page).to have_content(tau_ceti_system.created_at)
      expect(page).to have_content(kepler_11_system.created_at)

      expect(page).to have_content("Created at: #{the_solar_system.created_at}")
      expect(page).to have_content("Created at: #{tau_ceti_system.created_at}")
      expect(page).to have_content("Created at: #{kepler_11_system.created_at}")
    end
  end
end