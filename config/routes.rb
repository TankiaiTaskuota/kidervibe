Rails.application.routes.draw do
  resources :posts
  resources :images
  resources :food_activities
  resources :foods
  resources :app_days
  resources :childerns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
