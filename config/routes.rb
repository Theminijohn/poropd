Rails.application.routes.draw do

  resources :accounts

  # Poro King
  root 'streamers#index'

  # Streamers
  resources :streamers

  # Items
  resources :items

end
