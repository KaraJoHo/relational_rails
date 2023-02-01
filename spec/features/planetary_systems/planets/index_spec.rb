require 'rails_helper'

RSpec.describe "Planetary Systems Planets Index" do 
  describe 'As a Visitor' do 
    describe 'When I visit /planetary_systems/:p_s_id/planets' do 
      it 'displays all planets(with attributes) associated with the given planetary system id' do 

        the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
        mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
        venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)

        tau_ceti_system = PlanetarySystem.create(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
        tau_ceti_e = Planet.create(name: "Tau Ceti E", planet_type: "Super Earth", year_discovered: 2017, confirmed: true, planetary_system_id: tau_ceti_system.id)
        tau_ceti_h = Planet.create(name: "Tau Ceti H", planet_type: "Super Earth", year_discovered: 2017, confirmed: true, planetary_system_id: tau_ceti_system.id)

        visit "planetary_systems/#{the_solar_system.id}/planets"

        expect(page).to have_content(mercury.name)
        expect(page).to have_content(mercury.planet_type)
        expect(page).to have_content(mercury.year_discovered)
        expect(page).to have_content(mercury.confirmed)
        expect(page).to have_content(mercury.planetary_system.name)

        expect(page).to have_content("Planet Type: #{mercury.planet_type}")
        expect(page).to have_content("Year Discovered: #{mercury.year_discovered}")
        expect(page).to have_content("Confirmed?: #{mercury.confirmed}")
        expect(page).to have_content("Planetary System: #{mercury.planetary_system.name}")

        expect(page).to have_content(venus.name)
        expect(page).to have_content(venus.planet_type)
        expect(page).to have_content(venus.year_discovered)
        expect(page).to have_content(venus.confirmed)
        expect(page).to have_content(venus.planetary_system.name)

        expect(page).to have_content("Planet Type: #{venus.planet_type}")
        expect(page).to have_content("Year Discovered: #{venus.year_discovered}")
        expect(page).to have_content("Confirmed?: #{venus.confirmed}")
        expect(page).to have_content("Planetary System: #{venus.planetary_system.name}")

        expect(page).to_not have_content(tau_ceti_e.name)
        expect(page).to_not have_content(tau_ceti_h.planet_type)
      end

      it 'displays another systems planets' do 

        the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
        mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
        venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)

        tau_ceti_system = PlanetarySystem.create(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
        tau_ceti_e = Planet.create(name: "Tau Ceti E", planet_type: "Super Earth", year_discovered: 2017, confirmed: true, planetary_system_id: tau_ceti_system.id)
        tau_ceti_h = Planet.create(name: "Tau Ceti H", planet_type: "Super Earth", year_discovered: 2017, confirmed: true, planetary_system_id: tau_ceti_system.id)

        visit "planetary_systems/#{tau_ceti_system.id}/planets"

        expect(page).to have_content(tau_ceti_e.name)
        expect(page).to have_content(tau_ceti_e.planet_type)
        expect(page).to have_content(tau_ceti_e.year_discovered)
        expect(page).to have_content(tau_ceti_e.confirmed)
        expect(page).to have_content(tau_ceti_e.planetary_system.name)

        expect(page).to have_content("Planet Type: #{tau_ceti_e.planet_type}")
        expect(page).to have_content("Year Discovered: #{tau_ceti_e.year_discovered}")
        expect(page).to have_content("Confirmed?: #{tau_ceti_e.confirmed}")
        expect(page).to have_content("Planetary System: #{tau_ceti_e.planetary_system.name}")

        expect(page).to have_content(tau_ceti_h.name)
        expect(page).to have_content(tau_ceti_h.planet_type)
        expect(page).to have_content(tau_ceti_h.year_discovered)
        expect(page).to have_content(tau_ceti_h.confirmed)
        expect(page).to have_content(tau_ceti_h.planetary_system.name)

        expect(page).to have_content("Planet Type: #{tau_ceti_h.planet_type}")
        expect(page).to have_content("Year Discovered: #{tau_ceti_h.year_discovered}")
        expect(page).to have_content("Confirmed?: #{tau_ceti_h.confirmed}")
        expect(page).to have_content("Planetary System: #{tau_ceti_h.planetary_system.name}")

        expect(page).to_not have_content(venus.name)
        expect(page).to_not have_content(venus.planet_type)
      end
    end
  end
end