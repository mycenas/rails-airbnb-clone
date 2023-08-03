Rails.application.routes.draw do
  devise_for :users
  root to: 'quests#index'

  # DM creates a quest
  get 'quests/new', to: 'quests#new', as: 'new_quest'
  post '/quests', to: 'quests#create', as: 'quests'

  # adventurer views available quests
  get '/quests', to: "quests#index"

  # adventurer views specific quest
  get '/quests/:id', to: 'quests#show', as: 'quest'

  # adventurer views their profile
  get '/users/:id', to: 'users#show', as: 'user'

  # adventurer books a quest
  get '/quests/:id/bookings/new', to: 'bookings#new', as: 'new_booking'
  post '/quests/:id/bookings', to: 'bookings#create', as: 'bookings'

  # dm views booking requests
  get '/bookings', to: 'bookings#index'

  # dm views a specific booking request
  get '/bookings/:id', to: 'bookings#show', as: 'booking'

  # dm accepts/rejects a booking request
  post '/bookings/:id/accept', to:'bookings#accept', as: 'accept_booking'
  post '/bookings/:id/decline', to: 'bookings#decline', as: 'decline_booking'

  # profile routes
  get 'profile', to: 'pages#profile', as: 'profile'
end
