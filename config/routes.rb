Rails.application.routes.draw do
  devise_for :user
  root 'welcome#index'

  get 'add_to_cart/:product_id', to: 'cart_products#new', as: 'add_to_cart'
  resources :products
  resources :carts
  resources :cart_products
end
  