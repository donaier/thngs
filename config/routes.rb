Rails.application.routes.draw do
  resources :tasks
  resources :lnks
  resources :lists
  devise_for :users

  root to: 'lists#index'

  patch 'toggle_help', controller: 'home', action: :toggle_help
  patch 'complete_task/:id', controller: 'tasks', action: :complete, as: 'complete_task'
end
