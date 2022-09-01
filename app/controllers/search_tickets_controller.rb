class SearchTicketsController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def find
   @start_station = RailwayStation.find(params[:start_station])
   @end_station = RailwayStation.find(params[:end_station])
   @routes = Route.searched_routes(@start_station, @end_station)
 end
end
