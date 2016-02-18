class UsersController < ApplicationController

  def index
    if user_signed_in?
      @users = User.all
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    @user = User.find(params[:id])

  end

  def follow
    @user = User.find(params[:id])
    if current_user.follow!(@user)
      redirect_to @user, notice: "Follow successful!"
    else
      redirect_to @user, notice: "Sorry, failed"
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :city, :country, :gender, :profile_pic, :password_confirmation,  :current_password)
  end
end
