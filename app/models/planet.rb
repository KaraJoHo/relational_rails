class Planet < ApplicationRecord 
  belongs_to :planetary_system
  validates_presence_of :name, :planet_type, :year_discovered
  validates :confirmed, inclusion: [true, false]
  before_save :capitalize_planet_name

  scope :only_true, -> {Planet.where(confirmed: true)}

  def self.search_planet_records(search)
    if search 
      name_search_key = Planet.find_by(name: search.capitalize)
      name_search_key ? self.where(id: name_search_key) : Planet.all
      # if name_search_key 
      #   self.where(id: name_search_key)
      # else 
      #   Planet.all 
      #  end
    else 
      Planet.all
    end
  end

  def capitalize_planet_name 
    self.name = name.capitalize
  end
end