class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
  has_many :station_indexs, through: :railway_stations_routes

  has_many :trains, inverse_of: :current_station, foreign_key: 'current_station_id'

  scope :ordered_railway_stations, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_index').uniq }

  def update_position(route, order)
    station_route = station_route(route)
    station_route.update(station_index: order) if station_route
  end

  def update_time(route, coming_time, department_time)
    staion_route = station_route(route)
    staion_route.update(coming_time: coming_time, department_time: department_time) if staion_route
  end

  def position_in(route)
    station_route(route).try(:station_index)
  end

  def coming_time(route)
    station_route(route).try(:coming_time)&.strftime('%Y-%m-%dT%H:%M:%S')
  end

  def department_time(route)
    station_route(route).try(:department_time)&.strftime('%Y-%m-%dT%H:%M:%S')
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end
