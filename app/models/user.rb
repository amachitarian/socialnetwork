class User < ActiveRecord::Base

  has_many :me_following, class_name: "Followers_Users", foreign_key: "followed_id", dependent: :destroy
  has_many :my_followers, class_name: "Followers_Users", foreign_key: "follower_id", dependent: :destroy

  has_many :following, through: :me_following, source :followed
  has_many :followers, through: :my_followers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
