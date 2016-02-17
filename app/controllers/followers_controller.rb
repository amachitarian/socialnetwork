class FollowersController < ApplicationController
  #before_action :logged_in_user

  def create
    # find the user from the User database,
    # with user_id that got passed as 'followed_id'
    # through the 'follow me' form submit on user.show view
    @user = User.find(params[:followed_id])
    current_user.me_following(@user)
    redirect_to @user
  end

end
