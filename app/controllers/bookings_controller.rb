class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.product = params[:id]
    if @booking.save
      flash[:success] = "Object successfully created"
      redirect_to booking_path(@booking)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  def change_status
    @booking.status = params[:status]
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end

end
