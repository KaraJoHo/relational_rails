class ChangeStarAgeToBeBigintInPlanetarySystems < ActiveRecord::Migration[5.2]
  def change
    change_column :planetary_systems, :star_age, :bigint
  end
end
