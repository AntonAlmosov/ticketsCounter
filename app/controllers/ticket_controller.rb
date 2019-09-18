class TicketController < ApplicationController
  def index
    if Ticket.first
      @ticket = Ticket.first
    else
      @ticket = Ticket.new
      @ticket.sum = 0
      if @ticket.save
        redirect_to root_path
      end
    end
  end

  def bought
    @ticket = Ticket.first
    @price = params[:price].to_i
    @ticket.sum = @ticket.sum + @price
    if @ticket.save
      redirect_to root_path
    end
  end

  def mistake
    @ticket = Ticket.first
    @price = params[:price].to_i
    @ticket.sum = @ticket.sum - @price
    if @ticket.save
      redirect_to root_path
    end
  end
end
