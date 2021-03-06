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
		quandl_key = Rails.application.secrets.QUANDL_KEY
		# Get and parse silver price data
		url = 'https://www.quandl.com/api/v1/datasets/LBMA/SILVER.json?api_key=' + quandl_key
		@silverdata = data = JSON.parse(open(url).read)

		# Set this days price to a variable
		@silver_price = @silverdata["data"][0][1]

    @silver = Silver.find(params[:id])
    @total_silver = @silver.count * @silver.silver_amount
    @total_silver_price_today = @silver_price * @total_silver
    @profit = @total_silver_price_today - @silver.price_paid
  end

  def index
  	quandl_key = Rails.application.secrets.QUANDL_KEY
  	# Get and parse silver price data
  	url = 'https://www.quandl.com/api/v1/datasets/LBMA/SILVER.json?api_key=' + quandl_key
  	@silverdata = data = JSON.parse(open(url).read)

  	# Set this days price to a variable
  	@silver_price = @silverdata["data"][0][1]

  	@silvers = Silver.all
  	@compiled_total_silver = Silver.sum(:total_silver)
  end

  def edit
  	@silver = Silver.find(params[:id])
  end

  def update
    @silver = Silver.find(params[:id])
    if @silver.update_attributes(silver_params)
      redirect_to @silver
    else
      render 'edit'
    end
  end

	def destroy
		@silver = Silver.find(params[:id])
		@silver.destroy

		respond_to do |format|
			format.html { redirect_to "/silvers" }
			format.js
		end
	end

	private
		def silver_params
			params.require(:silver).permit(:name, :silver_amount, :date_purchased, :notes, :price_paid, :count)
		end
end
