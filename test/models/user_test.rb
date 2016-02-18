require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @subscription = Subscription.create(:artist_id => @artist.id, :title => "Some song")
  end

  test "should have many songs" do
    assert @artist.save
    assert_equal [@song], @artist.songs
  end
end
