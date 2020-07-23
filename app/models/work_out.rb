class WorkOut < ApplicationRecord
  attachment :before_image
  attachment :after_image

  has_many :favorites
  #投稿をファボしたユーザーを直接アソシエーションで取得するため
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum muscle_group: { abs_core: 0, arms_shoulders: 1, gmax_legs: 2 }
  enum effect: { too_easy: 1, very_easy: 2, somewhat_easy: 3, just_right: 4, rather_tight: 5, tight: 6, very_tight: 7, too_tight: 8, my_limit: 9 }
  enum place: { gym: 0, home: 1, outdoors: 2 }

  validates :time, presence: true

  #ユーザーがツイートをお気に入りしたかどうかの判定メソッド
  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
