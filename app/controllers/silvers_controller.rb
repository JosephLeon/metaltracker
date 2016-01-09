class SilversController < ApplicationController
	def new
		@silver = Silver.new
	end

	def create
		@silver = Silver.new(silver_params)

		@silver.save

		respond_to do |format|
			format.html { redirect_to @silver }
			format.js
		end
	end

	def show
    @silver = Silver.find(params[:id])
  end

  def index
  	# Get and parse silver price data
  	url = 'https://www.quandl.com/api/v1/datasets/LBMA/SILVER.json'
  	@silverdata = data = JSON.parse(open(url).read)

  	# Set this days price to a variable
  	@silver_price = @silverdata["data"][0][1]

  	@silvers = Silver.all
  end

  def edit
  	@silver = Silver.find(params[:id])
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
			params.require(:silver).permit(:name, :silver_amount, :date_purchased, :notes, :price_paid, :count)
		end
end
