class TicketsController < ApplicationController
  before_action :set_train, only: %i[new create]

  def show
  end

  def index
    @tickets = Ticket.all
  end

  def new
    # byebug
    @ticket = Ticket.new
    @base_station = RailwayStation.find(params[:base_station])
    @end_station = RailwayStation.find(params[:end_station])
  end

  def create
    @ticket = @train.tickets.build(ticket_params)
    @ticket.user = User.first
    # @ticket.base_station_id = 1
    # @ticket.end_station_id = 3
    @ticket.firstname = 'As'
    # byebug
    if @ticket.save
      redirect_to tickets_path, notice: 'Ticket was successfully created.'
    else
      redirect_to new_train_ticket_path(@train)
    end
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def ticket_params
    params.require(:ticket).permit(:lastname, :firstname, :passport_id, :base_station, :end_station)
  end

end
