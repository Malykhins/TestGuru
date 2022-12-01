class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :my_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  def view_user_tests(level)
    tests.where(level: level)
  end
end
