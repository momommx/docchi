class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  #scope :answer_count, -> {order(answer_count: :desc)}
  
  #validates :answer, presence: true
end
