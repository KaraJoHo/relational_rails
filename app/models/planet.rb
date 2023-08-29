class Planet < ApplicationRecord 
  belongs_to :planetary_system
  validates :name, presence: true
  validates :planet_type, presence: true 
  validates :year_discovered, presence: true
  validates :confirmed, inclusion: [true, false]
  before_save :capitalize_planet_name

  scope :only_true, -> {Planet.where(confirmed: true)}

  def self.search_planet_records(search)
    if search 
      name_search_key = Planet.find_by(name: search.capitalize)
      if name_search_key 
        found = self.where(id: name_search_key)
      else 
        Planet.all 
       end
    else 
      Planet.all
    end
  end

  def capitalize_planet_name 
    self.name = name.capitalize
  end
end