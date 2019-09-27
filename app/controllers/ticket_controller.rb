class TicketController < ApplicationController
  def index
    if Ticket.first
      @ticket = Ticket.first
    else
      @ticket = Ticket.new
      @ticket.sum = 0
      @ticket.share = 0
      @ticket.normal = 0
      @ticket.shareDrink = 0
      @ticket.normalDrink = 0
      @ticket.discount = 0
      @ticket.upgrade = 0
      @ticket.free = 0

      if @ticket.save
        redirect_to root_path
      end
    end
  end

  def bought
    @ticket = Ticket.first
    @price = params[:price].to_i
    @ticket.sum = @ticket.sum + @price

    # Ticket counter
    if @price == 400
      @ticket.share = @ticket.share + 1
    elsif @price == 500
      @ticket.normal = @ticket.normal + 1
    elsif @price == 550
      @ticket.shareDrink = @ticket.shareDrink + 1
    elsif @price == 650
      @ticket.normalDrink = @ticket.normalDrink + 1
    elsif @price == 250
      @ticket.normalDrink = @ticket.discount + 1
    elsif @price == 150
      @ticket.normalDrink = @ticket.upgrade + 1
    elsif @price == 0
      @ticket.normalDrink = @ticket.free + 1
    end

    if @ticket.save
      redirect_to root_path
    end
  end

  def mistake
    @ticket = Ticket.first
    @price = params[:price].to_i

    # Ticket counter
    if @price == 400
      @ticket.share = @ticket.share - 1
    elsif @price == 500
      @ticket.normal = @ticket.normal - 1
    elsif @price == 550
      @ticket.shareDrink = @ticket.shareDrink - 1
    elsif @price == 650
      @ticket.normalDrink = @ticket.normalDrink - 1
    elsif @price == 250
      @ticket.normalDrink = @ticket.discount - 1
    elsif @price == 150
      @ticket.normalDrink = @ticket.upgrade - 1
    elsif @price == 0
      @ticket.normalDrink = @ticket.free - 1
    end 

    @ticket.sum = @ticket.sum - @price
    if @ticket.save
      redirect_to root_path
    end
  end
end
