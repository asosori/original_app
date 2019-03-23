class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, length: { maximum: 20 }
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, 
        :registerable,
        :recoverable, 
        :rememberable, 
        :validatable,
        :confirmable
end
