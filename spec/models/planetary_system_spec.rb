require 'rails_helper' 

RSpec.describe PlanetarySystem do 
  describe '#attributes/columns' do 
    it 'has a name, light years from earth, star age and metal rich star attributes' do
      solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)

      expect(solar_system.name).to eq("The Solar System")
      expect(solar_system.light_years_from_earth).to eq(0)
      expect(solar_system.star_age).to eq(4_600_000_000)
      expect(solar_system.metal_rich_star).to eq(true)
    end
  end

  describe 'relationship' do 
    it {should have_many :planets}
  end

  describe '::order_by_created_at' do 
    it 'orders the rows by when they were created at' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true, created_at: Time.now)
      tau_ceti_system = PlanetarySystem.create!(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false, created_at: Time.now - 1.day)
      kepler_11_system = PlanetarySystem.create!(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true, created_at: Time.now - 2.days)
      #require 'pry'; binding.pry
      expect(PlanetarySystem.order_by_created_at.to_a).to eq([the_solar_system, tau_ceti_system, kepler_11_system])
    end
  end


  describe '#planets_ordered_alphabetically' do 
    it 'can order the systems planets alphabetically' do 
      the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      neptune = Planet.create(name: "Neptune", planet_type: "Ice Giant", year_discovered: 1846, confirmed: true, planetary_system_id: the_solar_system.id)
      pluto = Planet.create(name: "Pluto", planet_type: "Dwarf", year_discovered: 1930, confirmed: false, planetary_system_id: the_solar_system.id)
      mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)

      expect(the_solar_system.planets_ordered_alphabetically).to eq([mercury, neptune, pluto])
    end
  end

  describe '#ordered_by' do 
    it 'sorts planets by a give pattern' do 
      the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      neptune = Planet.create(name: "Neptune", planet_type: "Ice Giant", year_discovered: 1846, confirmed: true, planetary_system_id: the_solar_system.id)
      pluto = Planet.create(name: "Pluto", planet_type: "Dwarf", year_discovered: 1930, confirmed: false, planetary_system_id: the_solar_system.id)
      mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)

      expect(the_solar_system.ordered_by(nil)).to eq([neptune, pluto, mercury])
      expect(the_solar_system.planets.all).to eq([neptune, pluto, mercury])
      expect(the_solar_system.ordered_by("alphabetical")).to eq([mercury, neptune, pluto])
      expect(the_solar_system.planets_ordered_alphabetically).to eq([mercury, neptune, pluto])
      expect(the_solar_system.ordered_by(1900)).to eq([pluto])
    end
  end

  describe 'validations' do 
    it 'is valid' do 
      the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      the_not_so_solar_system = PlanetarySystem.create(name: nil, light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      the_has_no_light_year_system = PlanetarySystem.create(name: "Solar  System", light_years_from_earth: nil, star_age: 4_600_000_000, metal_rich_star: true)
      the_has_no_age_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: nil, metal_rich_star: true)
      the_has_no_metal_rich_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: nil)

      expect(the_solar_system).to be_valid 
      expect(the_not_so_solar_system).to_not be_valid
      expect(the_has_no_light_year_system).to_not be_valid
      expect(the_has_no_age_system).to_not be_valid
      expect(the_has_no_metal_rich_system).to_not be_valid
    end
  end

  describe '#system_planet_count' do 
    it 'returns the systems number of planets' do 
      the_solar_system = PlanetarySystem.create!(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
      
      mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
      venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
      earth = Planet.create(name: "Earth", planet_type: "Terrestrial", year_discovered: 1543, confirmed: true, planetary_system_id: the_solar_system.id)

      expect(the_solar_system.system_planet_count).to eq(3)
    end
  end
end