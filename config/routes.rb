Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :homes
      resources :pets
      resources :likes
      resources :adopters
      resources :users
      post '/likes/create', to: 'likes#create'
      post '/users/login', to: 'users#login'
      post '/users/signup', to: 'users#create'
      get 'likes', to: 'users#get_likes'
      get 'adopter', to: 'users#get_adopter'
      get '/users/profile', to: 'adopters#profile'     
      post 'user_token' => 'user_token#create' 
      get 'validate', to: 'users#validate'
    end
  end
  
end
