class User < ApplicationRecord
  def view_user_tests(level)
    Tests
      .joins('JOIN result ON tests.id = result.tests_id')
      .where(tests: { level: level }, result: { user_id: self.id })
  end
end
