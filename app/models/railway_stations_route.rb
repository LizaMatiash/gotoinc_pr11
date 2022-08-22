class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  # validates :station_order, uniqueness: { scope: :route_id }

  before_validation :set_index, on: :create

  def set_index
    # if self.station_index.nil?
      self.station_index = (RailwayStationsRoute.where(route_id: self.route_id).pluck(:station_index).max || 0) + 1
    # end
  end
end
