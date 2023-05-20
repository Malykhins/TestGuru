class Badge < ApplicationRecord
  validates :name, presence: true
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
