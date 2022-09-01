class Ticket < ApplicationRecord

  belongs_to :user, optional: true
  # belongs_to :train
  belongs_to :train, optional: true
  belongs_to :base_station, class_name: 'RailwayStation', foreign_key: :base_station_id, optional: true
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id, optional: true
  # belongs_to :user
end
