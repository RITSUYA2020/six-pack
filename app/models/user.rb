class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :work_outs
  has_many :favorites, dependent: :destroy
  #ユーザーがファボしたツイートを直接アソシエーションで取得するため
  has_many :favorite_work_outs, through: :favorites, source: :work_out

  enum sex: { unknown: 0, male: 1, female: 2, others: 9 }

  validates :name, presence: true
  validates :email, presence: true
end
