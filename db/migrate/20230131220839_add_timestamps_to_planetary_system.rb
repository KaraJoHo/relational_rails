class AddTimestampsToPlanetarySystem < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:planetary_systems, null: false)
  end
end
