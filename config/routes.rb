Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
  resources :tweets do
    post 'like', to: 'likes#create'
    delete 'unlike', to: 'likes#destroy'
    
    post 'retweet', to: 'retweets#create'
    delete 'unretweet', to: 'retweets#destroy'

    
  end
  resources :users
resources :follows
resources :messages

 
root 'users#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  get '/home', to: 'tweets#index'
  get '/profile', to: 'users#show'
  


  get "up" => "rails/health#show", as: :rails_health_check
end
