Rails.application.routes.draw do
  
  resources :tweets
  resources :users, only: [:show,:new,:destroy,:edit]

 
root 'users#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  get '/home', to: 'tweets#index'
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
