class User < ActiveRecord::Base

  has_many :me_following, class_name: "Follower", foreign_key: "followed_id", dependent: :destroy
  has_many :my_followers, class_name: "Follower", foreign_key: "follower_id", dependent: :destroy

  # get the users a user is following
  has_many :following, through: :me_following, source: :followed
  # get the users a user is followed by
  has_many :followers, through: :my_followers, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #    # Follows a user.
  #  def follow(other_user)
  #    active_relationships.create(followed_id: other_user.id)
  #  end


end
