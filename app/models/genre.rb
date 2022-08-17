class Genre < ApplicationRecord
  has_many :topics
 
  validates :name, presence: true, on: :create
end
