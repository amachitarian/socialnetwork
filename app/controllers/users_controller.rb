class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user = User.update(user_params)
      redirect_to @user
    else
      render edit_user_registration_path
    end
  end

  def follow(other_user)
    me_following.create(followed_id :other_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :city, :country, :gender, :profile_pic, :password_confirmation,  :current_password)
  end
end
