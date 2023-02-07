require 'rails_helper'

RSpec.describe "Planetary System Update" do 
  describe 'visiting the parent show page' do 
    it 'has a link to update the planetary system' do 
      kepler_11_system = PlanetarySystem.create!(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)

      visit "/planetary_systems/#{kepler_11_system.id}"

      expect(page).to have_link("Update #{kepler_11_system.name}")

      click_link "Update #{kepler_11_system.name}" 

      expect(current_path).to eq("/planetary_systems/#{kepler_11_system.id}/edit")
    end

    it 'can fill out the form with updated information' do
      kepler_11_system = PlanetarySystem.create!(name: "Kepler, um..", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)

      visit "/planetary_systems/#{kepler_11_system.id}/edit"

      fill_in("Name", with: "Kepler-11")
      fill_in("Light Years From Earth", with: 2108)
      fill_in("Star Age", with: 300000)
      choose('true')
      click_button("Update #{kepler_11_system.name}")

      expect(current_path).to eq("/planetary_systems/#{kepler_11_system.id}")
      expect(page).to have_content("Kepler-11")
    end
  end
end