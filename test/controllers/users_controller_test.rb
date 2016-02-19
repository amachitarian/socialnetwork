  require 'test_helper'

class UsersControllerTest < ActionController::TestCase
include Devise::TestHelpers


   setup do
       @user = users(:one)
     end

     test "should get index" do
       sign_in User.first
       get :index
       assert_response :success
       assert_not_nil assigns(:users)
     end

       #
      #  test "should show user" do
      #       sign_in @user
      #    get :show, id: @user
      #    assert_response :success
      #  end
       #
      #  test "should follow user" do
      #       sign_in @user
      #    post :follow, id: @user
      #    assert_response :success
      #  end
  end
