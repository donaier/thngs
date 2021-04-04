Rails.application.routes.draw do
  resources :tasks
  resources :lists
  devise_for :users
  # get 'home/index'

  root to: 'lists#index'
end
