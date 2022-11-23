# frozen_string_literal: true

class Test < ApplicationRecord
  def self.sort_tests(name_of_category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: name_of_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
