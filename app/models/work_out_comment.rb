class WorkOutComment < ApplicationRecord
	validates :comment, presence: true
end
