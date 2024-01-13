Rails.application.routes.draw do
  
  resources :tweets, except: [:new, :edit]

  # Users routes
  resources :users, only: [:new, :create]

 
root 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
