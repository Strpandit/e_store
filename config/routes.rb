Rails.application.routes.draw do
  devise_for :user
  root 'welcome#index'

  resources :products do
    collection do
      get 'search'
      # get 'upload_excel' # Form for uploading Excel sheet
      # post 'upload_excel' # Handle Excel sheet upload
      # get 'download_excel'

      post :import
    end
  end
  get 'add_to_cart/:product_id', to: 'cart_products#new', as: 'add_to_cart'
  # get '/products/:id', to: 'products#show', as: 'show_product'
  delete 'products/:id', to: 'products#destroy', as: 'delete_product'

  get 'clothing', to: "categories#clothing", as: 'clothing'
  get 'electronic', to: "categories#electronic", as: 'electronic'
  get 'watch', to: "categories#watch", as: 'watch'
  get 'bag', to: "categories#bag", as: 'bag'
  get 'footwear', to: "categories#footwear", as: 'footwear'
  get 'book', to: "categories#book", as: 'book'
  # get 'products/:id', to: "products#show", as: 'show_product'

  resources :carts
  resources :cart_products
  resources :categories
  get 'get_sub_category', to: "categories#get_sub_category"

  resources :profiles

  resources :company_details
  delete 'companies_details/:id', to: 'company_details#destroy', as: 'delete_companies_details'
end
  