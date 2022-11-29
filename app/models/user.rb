class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :tests, foreign_key: :author_id, dependent: :nullify

  def view_user_tests(level)
    Tests
      .joins('JOIN result ON tests.id = result.tests_id')
      .where(tests: { level: level }, result: { user_id: self.id })
  end
end
