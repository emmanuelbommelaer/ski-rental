class ProductRatingController < ApplicationController
  def new
    @product_rating = Product_rating.new
  end

  def create
    @product_rating = Product_rating.new(product_rating_params)

    if @product_rating.save

      redirect_to bookings_path, notice: 'your rating and comment has been added'
    else
      render 'new'
    end
  end

  private

  def product_rating_params
    params.require(:product_ratings).permit(:rating, :comment)
  end
end
