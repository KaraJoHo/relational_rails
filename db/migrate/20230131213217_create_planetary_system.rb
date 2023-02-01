class CreatePlanetarySystem < ActiveRecord::Migration[5.2]
  def change
    create_table :planetary_systems do |t|
      t.string :name
      t.integer :light_years_from_earth
      t.integer :star_age
      t.boolean :metal_rich_star
    end
  end
end
