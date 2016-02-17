Rails.application.routes.draw do

  root 'users#index'
  devise_for :users
  resources :users

  resources :followers, only: [:create, :destroy]

end
