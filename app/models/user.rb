class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :work_outs, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum sex: { unknown: 0, male: 1, female: 2, others: 9 }

  validates :name, presence: true
  validates :email, presence: true
end
