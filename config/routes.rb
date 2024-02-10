Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"

  resources :products do
    resources :bookings, only: [:new, :create]
  end




  get "/owned-products", to: "products#index_owned", as: :owned_products

  get "/bookings", to: "bookings#index"
  patch "/bookings/:id", to: "bookings#change_status", as: :booking

  get "/rentals", to: "bookings#rentals_index", as: :rentals

  get "products/users/:id", to: "products#index_for_user", as: :user_products

  get "bookings/:id/ratings/new", to: "ratings#new", as: :new_rating

  post "bookings/:id/ratings", to: "ratings#create", as: :booking_ratings


end
