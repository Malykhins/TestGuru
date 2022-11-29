# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :user

  def self.sort_tests(name_of_category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: name_of_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
