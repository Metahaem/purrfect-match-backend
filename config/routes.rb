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
      get '/users/profile', to: 'adopters#profile'     
      post 'user_token' => 'user_token#create' 
      get 'validate', to: 'users#validate'
    end
  end
  
end
