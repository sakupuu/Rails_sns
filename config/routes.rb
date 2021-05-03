Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end

  resources :tweets do
    resources :comments, only: [:create]
  end

  resources :users
end