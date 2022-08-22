class Route < ActiveRecord::Base
  validates :name, presence: true
  has_many :trains
  has_many :railway_stations_routes, -> { order('station_index ASC')}
  has_many :railway_stations, through: :railway_stations_routes, dependent: :destroy
  # has_many :station_indexs, through: :railway_stations_routes, dependent: :destroy


  validate :stations_count

  before_validation :set_name

  def change_station_index(station, order)
    if order < railway_stations_routes.size && order.positive?
      start = railway_stations_routes.where(railway_station: station).first.station_index
      # puts "Start is #{start}"
      if start < order
        loop do
          start += 1
          railway_stations_routes.where(station_index: start).first.update(station_index: (start - 1))
          break if start == order
        end
      else
        final = order
        loop do
          final -= 1
          railway_stations_routes.where(station_index: final).first.update(station_index: (final + 1))
          break if start == final
        end
      end
      railway_stations_routes.where(railway_station: station).first.update(station_index: order)
    else
      errors.add(:base, "Station order can`t be more than #{railway_stations_routes.size} and less than 1")
    end
  end

  # scope :ordered_railway_stations, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_order') }

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
