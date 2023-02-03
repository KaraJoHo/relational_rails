class Planet < ApplicationRecord 
  belongs_to :planetary_system

  def self.only_true 
     Planet.where(confirmed: true)
  end
end