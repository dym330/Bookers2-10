class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  attachment :profile_image, destroy: false
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}

  #ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  #ユーザーのフォロー解除
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  #現在のユーザーがフォローしているか否か
  def following?(other_user)
    following.include?(other_user)
  end

  def self.search(search, how_search)
	  if how_search == "1"
	    self.where(['name LIKE ?', "#{search}"])
	  elsif how_search == "2"
	    self.where(['name LIKE ?', "#{search}%"])
	  elsif how_search == "3"
	    self.where(['name LIKE ?', "%#{search}"])
	  elsif how_search == "4"
	    self.where(['name LIKE ?', "%#{search}%"])
	  end
  end

end
