Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :homes
      resources :pets
      resources :likes
      resources :adopters
      post '/likes/create', to: 'likes#create'
      post '/users/login', to: 'auth#create'
      get '/users/profile', to: 'adopters#profile'      
    end
  end
  
end
