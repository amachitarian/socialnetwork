Rails.application.routes.draw do

  root 'posts#index'
  devise_for :users,
             :controllers => { :registrations => "registrations"},
             :path => "",
             :path_names => {  :sign_in =>       'login',
                               :sign_out =>      'logout',
                               :sign_up =>       '',
                               :registration =>  'register',
                               :edit =>          'edit',
                               :cancel =>        'cancel',
                               :confirmation =>  'verification'}

  resources :users do
    member do
      post :follow, as: :add_follower
      # get :follow, as: :view_followers
      delete :unfollow, as: :remove_follower
    end
  end

  resources :posts do
    resources :comments
    resources :likes
  end

end
