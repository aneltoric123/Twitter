Rails.application.routes.draw do
  get 'tweets/index'
  get 'tweets/show'
  get 'tweets/new'
  get 'tweets/edit'
  get 'tweets/create'
  get 'tweets/destory'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
root 'tweets#index'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
get '/login', to: 'sessions#new'
# For users (registration)
resources :users, only: [:new, :create]

end
