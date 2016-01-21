class Silver < ActiveRecord::Base
	# Params we have to work with.
	# :name, :silver_amount, :date_purchased, :notes, :price_paid, :count
	# @TODO set the price of silver at purchase into new column :silver_price_at_purchase
	# Calculate the profit by subtracting the :silver_price_at_purchase processed through
	# an algorithm :total_silver * :silver_price_at_purchase - :price_paid.
	# Calculate a silver sell price based on that profit margin.
	before_save :calculate_total_silver

	def calculate_total_silver
		unless self.count.blank?
			unless self.silver_amount.blank?
				@total_silver = self.count * self.silver_amount
				self.total_silver = @total_silver
			end
		end
	end

	def calculate_sell_point
		unless self.count.blank?
			unless self.total_silver.blank?
				unless self.price_paid.blank?
					# Get :silver_price_at_purchase
					quandl_key = Rails.application.secrets.QUANDL_KEY
					url = 'https://www.quandl.com/api/v1/datasets/LBMA/SILVER.json?api_key=' + quandl_key
					@silverdata = data = JSON.parse(open(url).read)
					@silver_price = @silverdata["data"][0][1]
					self.silver_price_at_purchase = @silver_price

					# Get initial profit
					self.initial_profit = self.total_silver * self.silver_price_at_purchase - self.price_paid
					# @double_profit = self.price_paid * 2
				end
			end
		end
	end
end
