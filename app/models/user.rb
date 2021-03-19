class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers, foreign_key: :follower_id , class_name: "Relationship"
  has_many :followings, through: :followers
  has_many :followings, foreign_key: :following_id, class_name: "Relationship"
  has_many :followers, through: :followings
end
