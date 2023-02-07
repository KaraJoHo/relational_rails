require 'rails_helper' 

RSpec.describe "Planet Update" do 
  before :each do 
    @the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
    @neptune = Planet.create(name: "Neptone", planet_type: "Ice Giant", year_discovered: 1946, confirmed: true, planetary_system_id: @the_solar_system.id)
  end
  describe 'When visiting the planets show page' do 
    it 'has a link to update the planet' do 

      visit "/planets/#{@neptune.id}"

      expect(page).to have_link("Update Planet")

      click_link "Update Planet"

      expect(current_path).to eq("/planets/#{@neptune.id}/edit")
    end

    it 'has a form to update the planet and submit/redirect to show page' do 
     
      visit "/planets/#{@neptune.id}/edit"

      fill_in("Name", with: "Neptune")
      fill_in("Planet Type", with: "Ice Giant")
      fill_in("Year Discovered", with: 1846)
      choose('true')
      click_button("Update Planet") 

      expect(current_path).to eq("/planets/#{@neptune.id}")
      expect(page).to have_content("Neptune")
      expect(page).to have_content("1846")
      
    end
  end
end