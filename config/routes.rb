Rails.application.routes.draw do
  devise_for :users

  resources :boards
  resources :lists
  resources :tasks
  resources :lnks

  root to: 'lists#index'
  get 'home/profile'

  patch 'toggle_help', controller: 'home', action: :toggle_help
  patch 'complete_task/:id', controller: 'tasks', action: :complete, as: 'complete_task'
end
