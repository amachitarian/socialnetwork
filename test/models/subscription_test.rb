require "test_helper"

class Followers_Test < ActiveSupport::TestCase

  def setup
    @follower = Follower.new(follower_id: 1, followed_id: 2)
  end

  test "Should be valid" do
    assert @follower.valid?
  end

  test "should require a follower_id" do
    @follower.follower_id = nil
    assert_not @follower.valid?
  end

  test "should require a followed_id" do
    @follower.followed_id = nil
    assert_not @follower.valid?
  end

end
