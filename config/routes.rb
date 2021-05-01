Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users

  root 'users#index'
  get 'users/show'

  resources :tweets  
  resources :users
end
