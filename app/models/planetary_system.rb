class PlanetarySystem < ApplicationRecord 
  has_many :planets, dependent: :destroy
  validates :name, presence: true
  validates :light_years_from_earth, presence: true
  validates :star_age, presence: true
  validates :metal_rich_star, inclusion: [true, false]

  # def self.order_by_created_at
  #   order(created_at: :DESC)
  # end

  scope :order_by_created_at, -> {self.order(created_at: :DESC)}

  def planets_ordered_alphabetically 
    self.planets.order(:name)
  end

  def ordered_by(order_pattern)
    if order_pattern.nil?
      self.planets.all
    elsif order_pattern == "alphabetical"
      self.planets_ordered_alphabetically
    elsif order_pattern.to_i.class == Integer 
      self.planets.where("year_discovered > #{order_pattern}")
    end
  end

  def self.sorted_by(sort_pattern)
    if sort_pattern.nil? 
      order_by_created_at
    elsif sort_pattern == "num_of_planets"
      self.left_joins(:planets).group(:id).order('COUNT(planets.id) DESC')
    end
  end

  def self.search_records(search)
    if search
      name_search_key = PlanetarySystem.find_by(name: search)
      if name_search_key 
        self.where(id: name_search_key)
      else
        PlanetarySystem.all
      end
    else 
      PlanetarySystem.all
    end
  end

  def system_planet_count 
    planets.count
  end
end