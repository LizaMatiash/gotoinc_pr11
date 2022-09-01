class Route < ActiveRecord::Base
  validates :name, presence: true
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes, dependent: :destroy

  validate :stations_count
  before_validation :set_name

  scope :with_station, -> (station) { Route.joins(:railway_stations).where('railway_stations.id = ?', station.id) }

  def self.searched_routes(start_station, end_station)
    Route.with_station(start_station) &
    Route.with_station(end_station)
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, 'Route should contain at least 2 stations')
    end
  end
end
