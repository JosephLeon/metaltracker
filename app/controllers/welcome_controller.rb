class WelcomeController < ApplicationController
	require 'open-uri'

  def index
    quandl_key = Rails.application.secrets.QUANDL_KEY
    
  	# Get and parse gold price data
  	url = 'https://www.quandl.com/api/v3/datasets/BUNDESBANK/BBK01_WT5511.json?api_key=' + quandl_key
  	@golddata = data = JSON.parse(open(url).read)

  	# Get and parse silver price data
  	url = 'https://www.quandl.com/api/v1/datasets/LBMA/SILVER.json?api_key=' + quandl_key
  	@silverdata = data = JSON.parse(open(url).read)

  	# Set this days price to a variable
  	@gold_price = @golddata["dataset"]["data"][0][1]
  	@silver_price = @silverdata["data"][0][1]
  end
end
