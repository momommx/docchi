class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  
  #validates :answer, presence: true
end
