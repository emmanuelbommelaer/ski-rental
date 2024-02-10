class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.product = @product
    @booking.status = "Pending"
    if @booking.save
      flash[:success] = "Object successfully created"
      redirect_to bookings_path
    else
      flash[:error] = "Something went wrong"
      render "products/show", status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  def rentals_index
    @owned_bookings = Booking.joins(:product).where(product: { user: current_user })
  end

  def change_status
    @owned_bookings = Booking.joins(:product).where(product: { user: current_user })
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.update(booking_params)
    render "rentals_index", status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :product_id, :message)
  end
end
