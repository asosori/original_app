class Post < ApplicationRecord
  validates :university, presence: true
  validates :department, presence: true
  validates :major, presence: true
  validates :professor, presence: true
  validates :detail, presence: true
  belongs_to :user
  validates_uniqueness_of :user_id
end