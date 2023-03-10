require 'rails_helper' 

RSpec.describe "New Child Creation" do 
  before :each do 
    @the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
    @mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: @the_solar_system.id)
    @venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: @the_solar_system.id)
  end
  describe 'When visiting a planetary systems planet page' do 
    it 'has a link to add a new child for that parent' do 
      visit "/planetary_systems/#{@the_solar_system.id}/planets"

      expect(page).to have_link("Create Planet")

      click_link "Create Planet"

      expect(current_path).to eq("/planetary_systems/#{@the_solar_system.id}/planets/new")
    end

    it 'it has a form to fill in attributes and submit, create and post to the planetary system planets index' do 
      visit "/planetary_systems/#{@the_solar_system.id}/planets/new"

      fill_in("Name", with: "Earth")
      fill_in("Planet Type", with: "Terrestrial")
      fill_in("Year Discovered", with: 1543)
      choose('true')
      # fill_in("Confirmed?", with: true)
      click_button("Create Planet")
      

      expect(current_path).to eq("/planetary_systems/#{@the_solar_system.id}/planets")
      expect(page).to have_content("Earth")
    end
  end
end