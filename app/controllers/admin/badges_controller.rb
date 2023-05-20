class Admin::BadgesController < ApplicationController
  before_action :set_badges, only: %i[index select]

  def index
  end

  def select
      @badges.each_with_index do |badges_data, index|
        badge = Badge.find_by(name: badges_data[:name])

        if params["badge_#{index}"] == '1'
          Badge.create(badges_data) unless badge
        elsif params["badge_#{index}"] == '0'
          badge.destroy if badge
        end
      end

    redirect_to admin_tests_path, notice: "Badges for users successfully selected!"
  end

  private

  def set_badges
    @badges = [
      { name: 'The test passed with a 100 percent result', image: 'clever.png' },
      { name: 'All tests from the category passed', image: 'cup.png' }
    ]
  end
end
