class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.product_id = params[:product_id]
    @booking.status = "pending"
    if @booking.save
      flash[:success] = "Object successfully created"
      redirect_to bookings_path
    else
      flash[:error] = "Something went wrong"
      redirect_to product_path(params[:product_id]), status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
    @owned_bookings = Booking.joins(:product).where(product: { user: current_user })
  end

  def change_status
    @booking.status = params[:status]
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :product_id)
  end

end
