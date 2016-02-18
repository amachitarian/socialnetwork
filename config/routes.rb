Rails.application.routes.draw do

  root 'users#index'
  devise_for :users,
             :controllers => { :registrations => "registrations"},
             :path => "",
             :path_names => {  :sign_in =>       'login',
                               :sign_out =>      'logout',
                               :sign_up =>       '',
                               :registration =>  'register',
                               :edit =>          'edit',
                               :cancel =>        'cancel',
                               :confirmation =>  'verification' }

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :followers, only: [:create, :destroy]

end
