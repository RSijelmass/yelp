class Post < ApplicationRecord
	belongs_to :user
	has_many :comments

	def time_posted(date_posted)
		current_date = Time.now
		time_elapsed = current_date - date_posted 

		if time_elapsed >	(3600 * 24)
			days = time_elapsed / (3600 * 24)
			return "#{days.floor}d ago"
		elsif time_elapsed > 3600
			hours = time_elapsed / 3600
			return "#{hours.floor}h ago"
		else
			minutes = time_elapsed / 60
			return "#{minutes.floor}m ago"
		end
	end
end
