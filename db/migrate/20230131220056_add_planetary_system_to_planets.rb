class AddPlanetarySystemToPlanets < ActiveRecord::Migration[5.2]
  def change
    add_reference :planets, :planetary_system, foreign_key: true
  end
end
