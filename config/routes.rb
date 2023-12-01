# config/routes.rb
Rails.application.routes.draw do
  root 'welcome#index' 
 # config/routes.rb
  devise_for :users

end
