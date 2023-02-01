require 'rails_helper' 

RSpec.describe "Planets Show Page" do 
  describe 'As a visitor' do 
    describe 'When I visit /planets/:id' do 
      it ' displays the child of the id given with their attributes' do 
        the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
        mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
        venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)

        visit "/planets/#{mercury.id}"

        expect(page).to have_content(mercury.name)
        expect(page).to have_content(mercury.planet_type)
        expect(page).to have_content(mercury.year_discovered)
        expect(page).to have_content(mercury.confirmed)
        expect(page).to have_content(mercury.planetary_system.name)

        expect(page).to have_content("Planet Type: #{mercury.planet_type}")
        expect(page).to have_content("Year Discovered: #{mercury.year_discovered}")
        expect(page).to have_content("Confirmed?: #{mercury.confirmed}")
        expect(page).to have_content("Planetary System: #{mercury.planetary_system.name}")

        expect(page).to_not have_content(venus.name)
        expect(page).to_not have_content("Year Discovered: #{venus.year_discovered}")
      end
    end
  end
end