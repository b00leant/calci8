Rails.application.routes.draw do
  root 'home#index'

  resources :matches
  resources :free_matches
  resources :teams
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  #routes.rb
  match 'users/:id' => 'users#show', via: :get
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
  get 'teams/:id/add_player_conf', :to => 'teams#add_player_conf', as: 'add_player_conf'
  post 'teams/:id/add_player_done', :to => 'teams#add_player_done', as: 'add_player_done'
end
