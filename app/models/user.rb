# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges


  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP}

  scope :test_level, ->(level) { where(level:) }

  def view_user_tests(level)
    tests.test_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def award(test_passage)
    @user_badges = []

    Badge.all.each do |badge|
      method_name = badge.name.downcase.gsub(/[^0-9a-z]/, '_').squeeze('_')

      if BadgeService.new(test_passage).send("check_#{method_name}?")
        UserBadge.create!(user: test_passage.user, badge: badge)
        @user_badges.push([badge.name, badge.image])
      end
    end

    return @user_badges
  end

  private


end
