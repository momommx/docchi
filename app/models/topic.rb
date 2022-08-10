class Topic < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :answers,   dependent: :destroy
  belongs_to :genre 
  belongs_to :user
  
  validates :topic_title, presence: true
  validates :option1,     presence: true
  validates :option2,     presence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(word)
    @topic = Topic.where("topic_title LIKE?","%#{word}%")
  end
  
end
