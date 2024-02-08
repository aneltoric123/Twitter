Rails.application.routes.draw do
  get 'replies/create'
  
  ActiveAdmin.routes(self)
  
  resources :tweets do
    resources :replies, only: [:create, :edit, :update, :destroy]
    post 'like', to: 'likes#create'
    delete 'unlike', to: 'likes#destroy'
    post 'create_reply', to: 'replies#create'
    post 'retweet', to: 'retweets#create'
    delete 'unretweet', to: 'retweets#destroy'

    
  end
  resources :users
  resources :messages

 
root 'users#new'
get '/auth/google_oauth2', to: 'sessions#google_oauth2'
  get '/auth/failure', to: redirect('/')
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  get '/home', to: 'tweets#index'
  get '/profile', to: 'users#show'
  

  


  get "up" => "rails/health#show", as: :rails_health_check
end
