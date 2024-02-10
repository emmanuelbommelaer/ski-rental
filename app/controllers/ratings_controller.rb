class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.find(params[:id])
    @rating = Rating.new(rating_params)
    @rating.booking = @booking

    if @rating.save
      redirect_to "/bookings", notice: "Rating added successfully"
    else
      render :new
    end

  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :comment)
  end
end
