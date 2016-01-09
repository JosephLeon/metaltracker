class WelcomeController < ApplicationController
	require 'open-uri'

  def index
    # Commented temporarily until quandl is back.
    
  	# Get and parse gold price data
  	# url = 'https://www.quandl.com/api/v3/datasets/BUNDESBANK/BBK01_WT5511.json'
  	# @golddata = data = JSON.parse(open(url).read)

  	# # Get and parse silver price data
  	# url = 'https://www.quandl.com/api/v1/datasets/LBMA/SILVER.json'
  	# @silverdata = data = JSON.parse(open(url).read)

  	# # Set this days price to a variable
  	# @gold_price = @golddata["dataset"]["data"][0][1]
  	# @silver_price = @silverdata["data"][0][1]
  end
end
