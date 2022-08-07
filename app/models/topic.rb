class Topic < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :answers,   dependent: :destroy
  belongs_to :genre,   dependent: :destroy
  belongs_to :user,    dependent: :destroy
  
  validates :topic_title, presence: true
  validates :option1,     presence: true
  validates :option2,     presence: true
  
  def favorited_by?(user)
  　favorites.exists?(user_id: user.id)
  end
 
end
