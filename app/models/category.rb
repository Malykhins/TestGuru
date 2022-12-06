# frozen_string_literal: true
class Category < ApplicationRecord
  default_scope { order(title: :asc) }
  has_many :tests, dependent: :nullify

  validate :title, presence: true
end
