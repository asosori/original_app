class Post < ApplicationRecord
  validates :university, presence: true
  validates :department, presence: true
  validates :major, presence: true
  validates :professor, presence: true
  validates :detail, presence: true
  belongs_to :user
  validates_uniqueness_of :user_id
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  def like?(user)
    like_users.include?(user)
  end
end
