Rails.application.routes.draw do
  resources :relationships
  resources :stops
  resources :itineraries
  resources :destinations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end