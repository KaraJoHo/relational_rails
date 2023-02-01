require 'rails_helper' do 
  RSpec.describe 'Planetary System Index Page' do 
    let(:the_solar_system) {PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)}
    let(:tau_ceti_system) {PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)}

    describe '#planetary system index' do 
      it 'displays the name of each parent record in the system' do 
        # User Story 1, Parent Index 

        # For each parent table
        # As a visitor
        # When I visit '/parents'
        # Then I see the name of each parent record in the system

        visit '/parents'

        expect(page).to have_content(the_solar_system.name)
        expect(page).to have_content(tau_ceti_system.name)
      end
    end
  end
end