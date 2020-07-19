class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :work_out
end
