class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  
  validates :answer_content, presence: true
  validates :option,         presence: true
end