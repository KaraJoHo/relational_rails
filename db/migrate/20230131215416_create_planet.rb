class CreatePlanet < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :type
      t.integer :year_discovered
      t.boolean :confirmed
    end
  end
end
