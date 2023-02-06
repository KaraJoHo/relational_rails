require 'rails_helper' 

RSpec.describe 'Planetary System Index Page' do 

   describe 'planetary system index' do 
    it 'displays the name of each parent record in the system' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
       
      visit "/planetary_systems"

      expect(page).to have_content(the_solar_system.name)
      expect(page).to have_content(tau_ceti_system.name)
    end

    it 'order records by most recently created first' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
      kepler_11_system = PlanetarySystem.create!(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)
      
      visit "/planetary_systems"

      expect(page).to have_content(the_solar_system.name)
      expect(page).to have_content(tau_ceti_system.name)
      expect(page).to have_content(kepler_11_system.name)

      expect(kepler_11_system.name).to appear_before(tau_ceti_system.name)
      expect(tau_ceti_system.name).to appear_before(the_solar_system.name)
    end

    it 'displays the records created at attribute' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
      kepler_11_system = PlanetarySystem.create!(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)
      
      visit "/planetary_systems"

      expect(page).to have_content(the_solar_system.name)
      expect(page).to have_content(tau_ceti_system.name)
      expect(page).to have_content(kepler_11_system.name)

      expect(kepler_11_system.name).to appear_before(tau_ceti_system.name)
      expect(tau_ceti_system.name).to appear_before(the_solar_system.name)

      expect(page).to have_content(the_solar_system.created_at)
      expect(page).to have_content(tau_ceti_system.created_at)
      expect(page).to have_content(kepler_11_system.created_at)

      expect(page).to have_content("Created at: #{the_solar_system.created_at}")
      expect(page).to have_content("Created at: #{tau_ceti_system.created_at}")
      expect(page).to have_content("Created at: #{kepler_11_system.created_at}")
    end

    it 'has a link to the child index' do 
      visit "/planetary_systems"

      expect(page).to have_link('Planets Index')
       
      click_link 'Planets Index'

      expect(current_path).to eq('/planets')   
    end

    it 'has a link next to each system to update it' do 

      kepler_11_system = PlanetarySystem.create!(name: "Kepler, um..", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)
      the_solar_system = PlanetarySystem.create(name: "The So Sassy System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)

      visit "/planetary_systems"

      expect(page).to have_content("Kepler, um..")
      expect(page).to have_content("The So Sassy System")

      expect(page).to have_link("Edit #{kepler_11_system.name}")
      expect(page).to have_link("Edit #{the_solar_system.name}")
    end

    it 'can update the form after clicking the link' do 
      kepler_11_system = PlanetarySystem.create!(name: "Kepler, um..", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)
      the_solar_system = PlanetarySystem.create(name: "The So Sassy System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)

      visit "/planetary_systems"

      expect(page).to have_content("Kepler, um..")
      expect(page).to have_content("The So Sassy System")

      expect(page).to have_link("Edit #{kepler_11_system.name}")
      expect(page).to have_link("Edit #{the_solar_system.name}")

      click_link "Edit #{kepler_11_system.name}"

      expect(current_path).to eq("/planetary_systems/#{kepler_11_system.id}/edit")

      fill_in("Name", with: "Kepler-11")
      fill_in("Light Years From Earth", with: 2108)
      fill_in("Star Age", with: 300000)
      fill_in("Metal Rich Star?", with: true)
      click_button("Update #{kepler_11_system.name}")

      expect(current_path).to eq("/planetary_systems/#{kepler_11_system.id}")
      expect(page).to have_content("Kepler-11")
      expect(page).to have_content("2108")
      expect(page).to have_content("300000")
      expect(page).to have_content("true")
      #------------------------------------------------------------------------------
      # Going back to index page and editing the next solar system 
      #------------------------------------------------------------------------------
      visit "/planetary_systems"

      expect(page).to have_content("Kepler-11")

      click_link "Edit #{the_solar_system.name}"

      expect(current_path).to eq("/planetary_systems/#{the_solar_system.id}/edit")

      fill_in("Name", with: "Solar System")
      fill_in("Light Years From Earth", with: 0)
      fill_in("Star Age", with: 4_500_000_000)
      fill_in("Metal Rich Star?", with: true)
      click_button("Update #{the_solar_system.name}")

      expect(current_path).to eq("/planetary_systems/#{the_solar_system.id}")
      expect(page).to have_content("Solar System")

      visit "/planetary_systems"

      expect(page).to have_content("Kepler-11")
      expect(page).to have_content("#{kepler_11_system.created_at}")
     
      expect(page).to have_content("Solar System")
      expect(page).to have_content("#{the_solar_system.created_at}")
    end

    it 'has a link to delete the system next to each system record' do
      kepler_11_system = PlanetarySystem.create!(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)
      the_solar_system = PlanetarySystem.create!(name: "Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)

      mars = Planet.create(name: "Mars", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
      jupiter = Planet.create(name: "Jupiter", planet_type: "Gas Giant", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
      saturn = Planet.create(name: "Saturn", planet_type: "Gas Giant", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)

      kepler_11_f = Planet.create(name: "Kepler-11 F", planet_type: "Neptune-like", year_discovered: 2010, confirmed: true, planetary_system_id: kepler_11_system.id)
      kepler_11_b = Planet.create(name: "Kepler-11 B", planet_type: "Terrestrial", year_discovered: 2010, confirmed: true, planetary_system_id: kepler_11_system.id)

      visit "/planetary_systems"

      expect(page).to have_link("Delete #{kepler_11_system.name}")
      expect(page).to have_content("Delete #{the_solar_system.name}")

      click_link "Delete #{the_solar_system.name}"

      expect(current_path).to eq("/planetary_systems")
      
      expect(page).to_not have_content("Solar System") #why does this fail? It deletes properly in rails s/ update: rails db:{drop,create,migrate} is magic
      expect(PlanetarySystem.exists?(the_solar_system.id)).to eq(false)
      expect(Planet.exists?(mars.id)).to eq(false)
      expect(page).to have_content("Kepler-11")
    end
  end

  describe 'Sort parents by the number of children they have' do 
    it 'sorts the order of parents by the number of children, and adds the count' do 
      the_solar_system = PlanetarySystem.create!(name: "Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      kepler_11_system = PlanetarySystem.create!(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)

      mars = Planet.create(name: "Mars", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
      jupiter = Planet.create(name: "Jupiter", planet_type: "Gas Giant", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
      saturn = Planet.create(name: "Saturn", planet_type: "Gas Giant", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)

      kepler_11_f = Planet.create(name: "Kepler-11 F", planet_type: "Neptune-like", year_discovered: 2010, confirmed: true, planetary_system_id: kepler_11_system.id)
      kepler_11_b = Planet.create(name: "Kepler-11 B", planet_type: "Terrestrial", year_discovered: 2010, confirmed: true, planetary_system_id: kepler_11_system.id)

      visit "/planetary_systems"  
      
      # expect(page).to_not have_content("#{kepler_11_system.name} Number of Planets: ")
      expect(kepler_11_system.name).to appear_before(the_solar_system.name)
      expect(page).to have_link("Sort Systems by Number of Planets")  

      click_link "Sort Systems by Number of Planets" 

      expect(current_path).to eq("/planetary_systems")

      expect(the_solar_system.name).to appear_before(kepler_11_system.name)
      # expect(page).to have_content("#{kepler_11_system.name} Number of Planets: ")
      # After clicking the link, the number of planets shows next to each planetary system
    end
  end
end