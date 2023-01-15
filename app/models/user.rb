# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  include Auth

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  has_secure_password

  scope :test_level, ->(level) { where(level:) }

  def view_user_tests(level)
    tests.test_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
