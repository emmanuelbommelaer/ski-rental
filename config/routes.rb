Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"

  resources :products do
    resources :bookings, only: [:new, :create]
  end

  get "/owned-products", to: "products#index_owned", as: :owned_products

  get "/bookings", to: "bookings#index"
  patch "/bookings/:id", to: "bookings#change_status"

  get "/sales", to:"bookings#sales_index"
end
