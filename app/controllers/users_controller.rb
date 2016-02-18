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
    @posts = @user.posts
  end

  def follow
    @user = User.find(params[:id])
    if current_user.follow!(@user)
      respond_to do |format|
        format.html { redirect_to @user, notice: "Follow successful :)" }
        format.json { render json: { followers: @user.followers} }
        end
    else
      respond_to do |format|
        format.html { redirect_to @user, notice: "Sorry, you can't follow this user" }
        format.json { render json: { errors: @followers.errors }, status: :unprocessable_entity }
      end
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :city, :country, :gender, :profile_pic, :password_confirmation,  :current_password)
  end
end
