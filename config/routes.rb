Rails.application.routes.draw do
  resources :rooms
  resources :users
  resources :sessions
  resources :reservations
  resources :reviews
end
