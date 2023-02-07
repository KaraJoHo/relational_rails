# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

the_solar_system = PlanetarySystem.create(name: "The Solar System", light_years_from_earth: 0, star_age: 4_600_000_000, metal_rich_star: true)
tau_ceti_system = PlanetarySystem.create(name: "Tau Ceti", light_years_from_earth: 12, star_age: 5_800_000_000, metal_rich_star: false)
kepler_11_system = PlanetarySystem.create(name: "Kepler-11", light_years_from_earth: 2108, star_age: 3_200_000_000, metal_rich_star: true)

mercury = Planet.create(name: "Mercury", planet_type: "Terrestrial", year_discovered: 1631, confirmed: true, planetary_system_id: the_solar_system.id)
venus = Planet.create(name: "Venus", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
earth = Planet.create(name: "Earth", planet_type: "Terrestrial", year_discovered: 1543, confirmed: true, planetary_system_id: the_solar_system.id)
# 1543 was the year Nicolaus Copernicus detailed his heliocentric theory: that Earth is a planet among many that orbit around the sun. I chose this to
# represent the year that Earth was "discovered"
mars = Planet.create(name: "Mars", planet_type: "Terrestrial", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
jupiter = Planet.create(name: "Jupiter", planet_type: "Gas Giant", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
saturn = Planet.create(name: "Saturn", planet_type: "Gas Giant", year_discovered: 1610, confirmed: true, planetary_system_id: the_solar_system.id)
uranus = Planet.create(name: "Uranus", planet_type: "Ice Giant", year_discovered: 1781, confirmed: true, planetary_system_id: the_solar_system.id)
neptune = Planet.create(name: "Neptune", planet_type: "Ice Giant", year_discovered: 1846, confirmed: true, planetary_system_id: the_solar_system.id)
pluto = Planet.create(name: "Pluto", planet_type: "Dwarf", year_discovered: 1930, confirmed: false, planetary_system_id: the_solar_system.id)

tau_ceti_e = Planet.create(name: "Tau Ceti E", planet_type: "Super Earth", year_discovered: 2017, confirmed: true, planetary_system_id: tau_ceti_system.id)
tau_ceti_h = Planet.create(name: "Tau Ceti H", planet_type: "Super Earth", year_discovered: 2017, confirmed: true, planetary_system_id: tau_ceti_system.id)
tau_ceti_b = Planet.create(name: "Tau Ceti B", planet_type: "Terrestrial", year_discovered: 2012, confirmed: false, planetary_system_id: tau_ceti_system.id)

kepler_11_f = Planet.create(name: "Kepler-11 F", planet_type: "Neptune-like", year_discovered: 2010, confirmed: true, planetary_system_id: kepler_11_system.id)
kepler_11_b = Planet.create(name: "Kepler-11 B", planet_type: "Terrestrial", year_discovered: 2010, confirmed: true, planetary_system_id: kepler_11_system.id)
kepler_11_d = Planet.create(name: "Kepler-11 D", planet_type: "Neptune-like", year_discovered: 2010, confirmed: true, planetary_system_id: kepler_11_system.id)


