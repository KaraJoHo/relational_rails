class Planet < ApplicationRecord 
  belongs_to :planetary_system
  validates :name, presence: true
  validates :planet_type, presence: true 
  validates :year_discovered, presence: true
  validates :confirmed, inclusion: [true, false]

  def self.only_true 
     Planet.where(confirmed: true)
  end
end