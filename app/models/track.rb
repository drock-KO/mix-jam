class Track < ApplicationRecord
	has_many :liked_users, through: :likes, source: :user
	has_many :tags, through: :track_tags

	belongs_to :user
	has_many :track_tags
end
