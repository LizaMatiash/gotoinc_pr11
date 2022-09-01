module Admin
  class TicketsController < Admin::BaseController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
      @tickets = Ticket.all
    end

    def edit
    end

    def show
    end

    def destroy
      @ticket.destroy
      redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.'
    end

    private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  end

end
