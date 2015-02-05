Rails.application.routes.draw do

  # API
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :items,    only: :index
      resources :accounts, only: :index
    end
  end

  # Active Admin
  ActiveAdmin.routes(self)

  # Poro Executive Officer
  root 'streamers#index'

  # Streamers
  resources :streamers

  # Items
  resources :items

  # Acctounts
  resources :accounts do
    member do 
      get :update_information
    end
  end

  # Devise
  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register' }

end
