class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  
  #重複登録の防止
  validates :user_id, uniqueness: { scope: :topic_id }
end
