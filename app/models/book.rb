class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

  def self.search(search, how_search)
	  if how_search == "1"
	    self.where(['title LIKE ?', "#{search}"])
	  elsif how_search == "2"
	    self.where(['title LIKE ?', "#{search}%"])
	  elsif how_search == "3"
	    self.where(['title LIKE ?', "%#{search}"])
	  elsif how_search == "4"
	    self.where(['title LIKE ?', "%#{search}%"])
	  end
  end

end
