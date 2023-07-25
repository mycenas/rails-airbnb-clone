Rails.application.routes.draw do
  root 'quests#index'
  
  resources :users
  resources :quests
  resources :bookings
end
