require 'rails_helper'

RSpec.describe 'New/Create' do 
  describe 'When visiting planetary systems index' do 
    it 'has a link to create a new parent record' do 

      visit '/planetary_systems'

      expect(page).to have_link("New Planetary System")

      click_link "New Planetary System"

      expect(current_path).to eq('/planetary_systems/new')
    end

    it 'has a form to create a new planetary system' do 
      visit '/planetary_systems/new'
  
      fill_in("Name", with: "Supercool System")
      fill_in("Light Years From Earth", with: 20)
      fill_in("Star Age", with: 300000)
      choose('true')
      click_button("Create Planetary System")
     
      expect(current_path).to eq('/planetary_systems')
      expect(page).to have_content("Supercool System")
    end
  end

end