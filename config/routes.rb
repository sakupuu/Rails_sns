Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users
  resources :tweets  
  resources :users
  # root 'pages#index'
  # get 'pages/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
