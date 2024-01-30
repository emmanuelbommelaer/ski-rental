class BookingsController < ApplicationController
  # before_action :set_product, only: [:create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_use
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
    @owned_bookings = Booking.joins(:product).where(product: { user: current_user })
  end

  def change_status
    @booking.status = params[:status]
    @booking.save
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end

end
