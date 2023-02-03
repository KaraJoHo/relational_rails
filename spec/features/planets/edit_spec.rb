require 'rails_helper' 

# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe "Planet Update" do 
  before :each do 
    @the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
    @neptune = Planet.create(name: "Neptune", planet_type: "Ice Giant", year_discovered: 1846, confirmed: true, planetary_system_id: @the_solar_system.id)
  end
  describe 'When visiting the planets show page' do 
    it 'has a link to update the planet' do 
      visit "/planets/#{@neptune.id}"

      expect(page).to have_link("Update Planet")

      click_link "Update Planet"

      expect(current_path).to eq("/planets/#{@neptune.id}/edit")
    end
  end
end