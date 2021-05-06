Rails.application.routes.draw do

  root 'tweets#index'
  devise_for :users

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end

  resources :tweets do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :users

  resources :tweets, only: [:create, :new, :edit, :update, :destroy]

end