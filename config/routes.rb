Rails.application.routes.draw do
  use_doorkeeper
  root :to => 'me#index'

  resources :users, only: [:show, :new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'me' => 'me#index'
  post 'oauth_login/callback' => 'oauth_logins#callback'
  get 'oauth_login/callback' => 'oauth_logins#callback' # for use with Github, Facebook
  get 'oauth_login/:provider' => 'oauth_logins#oauth', :as => :auth_at_provider

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
