Rails.application.routes.draw do
  get 'interested_properties/index'
 
  # get 'deshboard/index'
  #get 'home/:index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users
  # Defines the root path route ("/")
  
  get 'my_properties', to: 'properties#user_properties', as: 'user_properties'
  root "home#index"
  resources :properties
  resources :interesteds, only: [:create]
  resources :enquiries, only: [:new, :create]
  resources :interested_properties, only: [:index, :destroy]
end
