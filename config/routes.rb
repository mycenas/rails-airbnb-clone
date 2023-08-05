Rails.application.routes.draw do
  devise_for :users
  root to: 'quests#index'

  # More specific routes
  get '/users/requests', to: 'users#requests', as: 'user_requests'
  get '/users/my_bookings', to: 'users#my_bookings', as: 'my_bookings'
  get 'profile', to: 'pages#profile', as: 'profile'

  # Quests routes
  get 'quests/new', to: 'quests#new', as: 'new_quest'
  post '/quests', to: 'quests#create', as: 'quests'
  get '/quests', to: "quests#index"
  get '/quests/:id', to: 'quests#show', as: 'quest'
  
  # Booking routes
  get '/quests/:id/bookings/new', to: 'bookings#new', as: 'new_booking'
  post '/quests/:id/bookings', to: 'bookings#create', as: 'bookings'
  get '/bookings', to: 'bookings#index'
  get '/bookings/:id', to: 'bookings#show', as: 'booking'
  post '/bookings/:id/accept', to:'bookings#accept', as: 'accept_booking'
  post '/bookings/:id/decline', to: 'bookings#decline', as: 'decline_booking'
  post '/bookings/:id/complete', to: 'bookings#complete', as: 'complete_booking'
  post '/bookings/:id/cancel', to:'bookings#cancel', as: 'cancel_booking'
  delete '/bookings/:id', to: 'bookings#destroy', as: 'delete_booking'

  # User routes
  get '/users/:id', to: 'users#show', as: 'user'

end
