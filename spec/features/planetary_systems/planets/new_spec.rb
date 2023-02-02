require 'rails_helper' 

# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

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
      fill_in("Confirmed?", with: true)
      fill_in("Planetary System ID", with: @the_solar_system.id)
      click_button("Create Planet")

      expect(current_path).to eq("/planetary_systems/#{@the_solar_system.id}/planets")
      expect(page).to have_content("Earth")
    end

  end
end