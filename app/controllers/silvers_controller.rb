class SilversController < ApplicationController
	def new
		@silver = Silver.new
	end

	def create
		@silver = Silver.new(silver_params)

		@silver.save

		respond_to do |format|
			format.html { redirect_to "/" }
			format.js
		end
	end

	def destroy
		@silver = Silver.find(params[:id])
		@silver.destroy

		respond_to do |format|
			format.html { redirect_to "/" }
			format.js
		end
	end

	private
		def silver_params
			params.require(:silver).permit(:name, :silver_amount, :date_purchased, :notes, :price_paid)
		end
end
