class StaticController < ApplicationController
	def home
	end

	def search
		where = [	'percent_from_fifty_day_moving_average > ?',
							'AND',
							'percent_from_fifty_day_moving_average < ?',
							'AND',
							'thirty_day_percent_volume_rate_of_change > ?',
							'AND',
							'thirty_day_percent_volume_rate_of_change < ?'#,
							#'AND',
							#'market_cap > ?',
							#'AND',
							#'market_cap < ?'
						]
		min_from_fifty_day_ma = -5
		max_from_fifty_day_ma = 5
		min_thirty_day_vroc = 200
		max_thirty_day_vroc = 1000000
		#min_market_cap = 0
		#max_market_cap = 9999999999999
		@companies = Company.where(where.join(" "), min_from_fifty_day_ma, max_from_fifty_day_ma,
			min_thirty_day_vroc, max_thirty_day_vroc).order('thirty_day_percent_volume_rate_of_change DESC').all
	end
end
