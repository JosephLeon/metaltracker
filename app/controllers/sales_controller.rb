class SalesController < ApplicationController
	def new
		@sale = Sale.new
	end

	def create
		# On creation we need to modify the inventory item we are selling.
		# On creation the inventory item should be removed from inventory.
		# We should be able to track what we sell's data as well as the 
		# sale objects data.
		@sale = Sale.new(sale_params)
		@sale.save

		respond_to do |format|
			format.html { redirect_to @sale }
			format.js
		end
	end

	def show
		@sale = Sale.find(params[:id])
	end

	def index
		@sales = Sale.all
	end

	def edit
		@sale = Sale.find(params[:id])
	end

	def destroy
		@sale = Sale.find(params[:id])
		@sale.destroy

		respond_to do |format|
			format.html { redirect_to "/" }
			format.js
		end
	end

	private
		def sale_params
			params.require(:sale).permit(:name, :income, :date, :details)
		end
end
