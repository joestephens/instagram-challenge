Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: "photos#index"
  resources :photos
end
