# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validate :title, presence: true, uniqueness: { scope: :level }
  validate :level, numericality: { only_integer: true, great_then_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_categories, (lambda do |name_of_category|
    joins(:category).where(categories: { title: name_of_category }).order(title: :desc)
  end)

  def self.sort_tests(name_of_category)
    sort_categories(name_of_category).pluck(:title)
  end
end
