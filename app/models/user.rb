# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :my_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validate :email, presence: true

  scope :test_level, ->(level) { where(level:) }

  def view_user_tests(level)
    tests.test_level(level)
  end
end
