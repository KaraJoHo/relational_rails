require 'rails_helper'

RSpec.describe "Planets Index Page" do 
  describe 'When a visitor visits /planets' do 
    describe 'They see each child including their attributes' do 
      it 'displays each child and their attributes' do 
        the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
        mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
        venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
        
        visit '/planets'

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
      end
    end
    it 'has a link to the planetary systems page' do 
      the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
      venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)

      visit "/planets"

      expect(page).to have_link('Planetary Systems')
       
      click_link 'Planetary Systems'

      expect(current_path).to eq('/planetary_systems')
    end

    it 'only shows the planets that are confirmed with a true value' do 
      the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      neptune = Planet.create(name: "Neptune", planet_type: "Ice Giant", year_discovered: 1846, confirmed: true, planetary_system_id: the_solar_system.id)
      pluto = Planet.create(name: "Pluto", planet_type: "Dwarf", year_discovered: 1930, confirmed: false, planetary_system_id: the_solar_system.id)
      mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)

      visit '/planets'

      expect(page).to have_content(neptune.name)
      expect(page).to have_content(mercury.name)
      expect(page).to_not have_content(pluto.name)
    end

    it 'has a link next to each planet to edit the planet' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      neptune = Planet.create!(name: "Neptone", planet_type: "Ice Giant", year_discovered: 1846, confirmed: true, planetary_system_id: the_solar_system.id)
      mercury = Planet.create(name: "Merkurie", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
      
      visit '/planets'

      expect(page).to have_content("Neptone")
      expect(page).to have_content("Merkurie")
      expect(page).to have_link("Edit #{neptune.name}")
      expect(page).to have_link("Edit #{mercury.name}")
    end

    it 'can click on the link to edit the planet' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      neptune = Planet.create!(name: "Neptune", planet_type: "Ice Giant", year_discovered: 1846, confirmed: true, planetary_system_id: the_solar_system.id)
      mercury = Planet.create(name: "Merkurie", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
      
      visit '/planets'

      expect(page).to have_content("Neptune")
      expect(page).to have_content("Merkurie")
      expect(page).to have_link("Edit #{neptune.name}")
      expect(page).to have_link("Edit #{mercury.name}")

      click_link "Edit #{mercury.name}"

      expect(current_path).to eq("/planets/#{mercury.id}/edit")

      fill_in("Name", with: "Mercury")
      fill_in("Planet Type", with: "Terrestrial")
      fill_in("Year Discovered", with: 1631)
      fill_in("Confirmed?", with: true)
      click_button("Update Planet") 

      expect(current_path).to eq("/planets/#{mercury.id}")
      expect(page).to have_content("Mercury")
      expect(page).to have_content("1631")

      visit "/planets"

      expect(page).to have_content("Mercury")
      expect(page).to have_content("1631")

    end
  end
end