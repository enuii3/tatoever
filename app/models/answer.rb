class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :for_example, presence: true
  validates :description, presence: true
end
