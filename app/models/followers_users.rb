class Followers_Users < ActiveRecord::Base

  belongs_to :me_following
  belongs_to :my_followers

end
