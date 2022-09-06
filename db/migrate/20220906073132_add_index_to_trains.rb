class AddIndexToTrains < ActiveRecord::Migration[6.1]
  def change
    add_index :trains, :current_station_id
  end
end
