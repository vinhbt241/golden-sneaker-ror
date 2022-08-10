Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"

  post "/add-order-to-cart", to: "homes#add_order_to_cart"
  delete "/remove-order-from-cart", to: "homes#remove_order_from_cart"

  post "/increase-order-quantity", to: "homes#increase_order_quantity"
  post "/decrease-order-quantity", to: "homes#decrease_order_quantity"
end
