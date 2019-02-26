Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :homes
      resources :pets
      resources :likes
      resources :adopters
      post '/likes/create', to: 'likes#create'
      post '/homes/login', to: 'auth#create'
      post '/adopters/login', to: 'auth#create'
      get '/adopters/profile', to: 'adopters#profile'
      get '/homes/profile', to: 'homes#profile'
      
    end
  end
  
end
