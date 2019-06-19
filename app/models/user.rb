class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tasks
  has_one_attached :avatar, dependent: :destroy
  attribute :new_avatar
  has_many:reviews, dependent: :destroy
  
  validates :nick_name, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  before_save do
    self.avatar = new_avatar if new_avatar
  end
end
