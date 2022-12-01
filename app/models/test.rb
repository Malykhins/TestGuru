# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :nullify


  def self.sort_tests(name_of_category)
    joins(:category)
      .where(categories: { title: name_of_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
