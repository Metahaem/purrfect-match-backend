Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :homes
      resources :pets
      resources :likes
      resources :adopters
      resources :user_stories
    end
  end
  
end
