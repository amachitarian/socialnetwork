class User < ActiveRecord::Base

    # subscibing to another user's posts by following that user
    has_many :subscriptions, foreign_key: :follower_id,
                             dependent: :destroy

    # a leader is the user being followed
    has_many :leaders, through: :subscriptions

    # users that subscribed to a user
    has_many :reverse_subscriptions, foreign_key: :leader_id,
                                     class_name: "Subscription",
                                     dependent: :destroy
    # a user's followers
    has_many :followers, through: :reverse_subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #    # Follows a user.
  #  def follow(other_user)
  #    active_relationships.create(followed_id: other_user.id)
  #  end

  def following?(leader)
    leaders.include? leader
  end

  def follow!(leader)
    if leader != self && !following?(leader)
      leaders << leader
    end
  end


end
