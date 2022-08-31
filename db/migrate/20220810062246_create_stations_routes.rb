class CreateStationsRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :railway_stations_routes do |t|
      t.integer :railway_station_id
      t.integer :route_id
      t.integer :station_index
      t.datetime :coming_time
      t.datetime :department_time
      # t.timestamps
    end
  end
end
