Rails.application.routes.draw do

  root 'users#index'
  devise_for :users
  resources :users
  
  resources :followers_users, only: [:create, :destroy]

end
