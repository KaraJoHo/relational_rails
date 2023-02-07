class Planet < ApplicationRecord 
  belongs_to :planetary_system
  validates :name, presence: true
  validates :planet_type, presence: true 
  validates :year_discovered, presence: true
  validates :confirmed, inclusion: [true, false]

  scope :only_true, -> {Planet.where(confirmed: true)}

  def self.search_planet_records(search)
    if search 
      name_search_key = Planet.find_by(name: search)
      if name_search_key 
        self.where(id: name_search_key)
      else 
        Planet.all 
      end
    else 
      Planet.all
    end
  end
end