class Silver < ActiveRecord::Base
	before_save :calculate_total_silver

	def calculate_total_silver
		unless self.count.blank?
			unless self.silver_amount.blank?
				@total_silver = self.count * self.silver_amount
				self.total_silver = @total_silver
			end
		end
	end
end
