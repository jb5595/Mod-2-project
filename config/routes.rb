Rails.application.routes.draw do
  resources :relationships
  resources :stops

  get '/destinations/:id/delete', to: "destinations#destroy", as: "delete_destination"
  get '/destinations/:id/edit', to: "destinations#edit", as: "edit_destination"
  resources :destinations, only: [:create, :new, :update, :index, :show]

  ######### Users Routes #########
  post "/users/:id/follow", to: "users#follow", as: "follow"
  post "/users/:id/unfollow", to: "users#unfollow", as: "unfollow"
  get "/users/:id/wishlist", to: "users#wishlist", as: "wishlist"
  post "/users/:itinerary_id/add_to_wish_list", to: "users#add_to_wish_list", as: "add_to_wish_list"
  post "/users/:itinerary_id/remove_from_wish_list", to: "users#remove_from_wish_list", as: "remove_from_wish_list"
  get "/users/feed", to: 'users#feed', as: "user_feed"
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'static#home', as: "root"


  ######### Sessions Routes #########
  get "/login", to: 'sessions#new', as: "login"
  post "/login", to: 'sessions#create', as: "create_session"
  get "/logout", to: 'sessions#destroy', as: "logout"

  ######### Itineraries Routes #########
  post 'itineraries/:id/like', to: "itineraries#like"
  resources :itineraries do
    resources :destinations, only: [:create, :new]
  end





end
