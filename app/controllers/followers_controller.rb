class FollowersController < ApplicationController
  #before_action :logged_in_user


  # find the user from the User database,
  # with user_id that got passed as 'followed_id'
  # through the 'follow me' form submit on user.show view
  def create
    @followed_user = User.find(params[:followed_id])
    current_user.follow(@followed_user, current_user.id)
    redirect_to @followed_user
  end

end
