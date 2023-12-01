Rails.application.routes.draw do
  devise_for :user
  root 'welcome#index'
  resource :cart, only: [:show] do
    post 'add_to_cart/:product_id', action: :add_to_cart, on: :member, as: 'add_to_cart'
    delete 'remove_from_cart/:product_id', action: :remove_from_cart, on: :member, as: 'remove_from_cart'
  end
end
