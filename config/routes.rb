Rails.application.routes.draw do
  root 'home#index'

  resources :matches
  resources :free_matches
  resources :teams
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  #routes.rb
  match 'users/:id' => 'users#show', via: :get
  match 'users/:id/settings' => 'users#settings', via: :get, as: 'user_settings'
  # or
  get 'users/:id' => 'users#show'
  # or
  resources :users, only: [:show]

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'teams/:id/select_new_players', :to => 'teams#select_new_players', as: 'select_new_players'
  post 'teams/:id/invite', :to => 'teams#invite', as: 'invite'
  post 'teams/:id/add_player', :to => 'teams#add_player', as: 'add_player'
end
