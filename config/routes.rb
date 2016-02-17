Rails.application.routes.draw do

  root 'users#index'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :followers, only: [:create, :destroy]

end
