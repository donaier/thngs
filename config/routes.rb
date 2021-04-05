Rails.application.routes.draw do
  resources :tasks
  resources :lists
  devise_for :users

  root to: 'lists#index'

  patch 'toggle_help', controller: 'home', action: :toggle_help
end
