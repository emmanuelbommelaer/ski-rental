class ProductRatingController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @rating = Rating.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @rating = Rating.new(product_rating_params)
    @rating.user_id = current_user.id
    @rating.product_id = @booking.product_id

    if @rating.save
      redirect_to @booking, notice: "Rating added successfully."
    else
      render :new
    end
  end

    private

  def product_rating_params
    params.require(:rating).permit(:rating, :comment)
  end
end
