class Topic < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :answers,   dependent: :destroy
  belongs_to :genre,   deoendent: :destroy
  belongs_to :user,    dependent: :destroy
  
  def favorited_by?(user)
  　favorites.exists?(user_id: user.id)
  end

end
