Rails.application.routes.draw do
  get 'view_purse/view_stats'
  get 'view_purse/view_abilities'
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
  get '/quests/:id/bookings/new', to: 'bookings#show', as: 'booking'

  # dm views booking requests
  get '/bookings', to: 'bookings#index'

  # dm views a specific booking request
  get '/bookings/:id', to: 'bookings#show'

  # dm accepts/rejects a booking request
  post '/bookings/:id/accept', to:'bookings#accept', as: 'accept_booking'
  post '/bookings/:id/decline', to: 'bookings#decline', as: 'decline_booking'

  # profile routes
  get 'profile/purse', to: 'profile#view_purse'
  get 'profile/stats', to: 'profile#view_stats'
  get 'profile/abilities', to: 'profile#view_abilities'
end
