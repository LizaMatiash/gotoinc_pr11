class Train < ApplicationRecord

  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :tickets
  has_many :vagons, -> (train) { order("order_v #{train.vagon_order ? 'ASC' : 'DESC'}") }

  def type_places(vagon_type, places_type)
    vagons.where(type: vagon_type).sum(places_type)
  end
end
