# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :nullify

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_categories, lambda { |name_of_category|
                            where(categories: { title: name_of_category })
                              .order(title: :desc)
                              .pluck(:title)
                          }

  def self.sort_tests(name_of_category)
    joins(:category).sort_categories(name_of_category)
  end
end
