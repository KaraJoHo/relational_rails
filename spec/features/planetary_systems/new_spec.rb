require 'rails_helper'
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

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
      # save_and_open_page

      fill_in("Name", with: "Supercool System")
      fill_in("Light Years From Earth", with: 20)
      fill_in("Star Age", with: 300000)
      fill_in("Metal Rich Star?", with: true)
      click_button("Create Planetary System")

      expect(current_path).to eq('/planetary_systems')
      expect(page).to have_content("Supercool System")
    end
  end

end