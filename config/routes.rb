Rails.application.routes.draw do
  devise_for :users

  resources :boards
  resources :lists
  resources :tasks
  resources :lnks

  root to: 'home#home'
  get 'home/profile'

  patch 'toggle_help', controller: 'home', action: :toggle_help
  patch 'set_home_board/:id', controller: 'home', action: :set_home_board
  patch 'complete_task/:id', controller: 'tasks', action: :complete, as: 'complete_task'
end
