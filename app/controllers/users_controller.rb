class UsersController < ApplicationController

  def index
    if user_signed_in?
      @users = User.all
      @user = current_user
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
        format.html { redirect_to @user, notice: "You are now following #{@user.name}." }
        format.json { render json: { followers: @user.followers} }
        end
    else
      respond_to do |format|
        format.html { redirect_to @user, notice: "Sorry, you can't #{@user.name}." }
        format.json {  }
      end
    end
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user.unfollow!(@user)
      respond_to do |format|
        format.html { redirect_to @user, notice: "You no longer follow #{@user.name}." }
        format.json { render json: { followers: @user.followers} }
      end
    else
        respond_to do |format|
          format.html { redirect_to @user }
          format.json {  }
        end
      end
   end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :city, :country, :gender, :profile_pic, :password_confirmation,  :current_password)
  end
end
