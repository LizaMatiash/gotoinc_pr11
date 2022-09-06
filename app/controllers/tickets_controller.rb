class TicketsController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy]
  before_action :set_train, only: %i[new create]

  def show
    @ticket = Ticket.find(params[:id])
  end

  def index
    @tickets = current_user.tickets
  end

  def new
    # byebug
    @ticket = Ticket.new
    @base_station = RailwayStation.find(params[:base_station])
    @end_station = RailwayStation.find(params[:end_station])
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  def create
    @ticket = @train.tickets.build(ticket_params)
    @ticket.user = current_user
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
