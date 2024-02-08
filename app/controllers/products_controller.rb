class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
    @markers = @products.map do |product|
      {
        userFirstName: product.user.first_name,
        userLastName: product.user.last_name,
        latitude: product.user.latitude,
        longitude: product.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {product: product})
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def index_owned
    @products = Product.where(user: current_user)
  end

  def index_for_user
    @products = Product.where(user_id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.sku = @product.name + 
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :category, :photo, :details, :price_per_day, :sku)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
