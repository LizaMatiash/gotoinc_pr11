module Admin
  class RailwayStationsController < Admin::BaseController
    before_action :set_railway_station, only: %i[show edit update destroy update_position update_time]

    def index
      @railway_stations = RailwayStation.all
    end

    def show
    end

    def new
      @railway_station = RailwayStation.new
    end

    def edit
    end

    def create
      @railway_station = RailwayStation.new(railway_station_params)

      respond_to do |format|
        if @railway_station.save
          format.html { redirect_to admin_railway_station_url(@railway_station), notice: "Railway station was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @railway_station.update(railway_station_params)
          format.html { redirect_to admin_railway_station_url(@railway_station), notice: "Railway station was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def update_position
      @route = Route.find(params[:route_id])
      @railway_station.update_position(@route, params[:station_index])
      redirect_to [:admin, @route]
    end

    def update_time
      @route = Route.find(params[:route_id])
      @railway_station.update_time(@route, params[:coming_time], params[:department_time])
      redirect_to [:admin, @route]
    end

    def destroy
      @railway_station.destroy

      respond_to do |format|
        format.html { redirect_to admin_railway_stations_url, notice: "Railway station was successfully destroyed." }
      end
    end

    private

      def set_railway_station
        @railway_station = RailwayStation.find(params[:id])
      end

      def railway_station_params
        params.require(:railway_station).permit(:title)
      end
  end

end
