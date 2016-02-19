require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  setup do
      @post = post(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:users)
end
