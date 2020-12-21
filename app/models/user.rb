class User < ApplicationRecord
  devise :database_authenticatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
