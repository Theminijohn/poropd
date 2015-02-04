Rails.application.routes.draw do

  # Poro King
  root 'streamers#index'

  # Streamers
  resources :streamers

  # Items
  resources :items

end
