class WelcomeController < ApplicationController
	require 'open-uri'

  def index
  	url = 'https://www.quandl.com/api/v3/datasets/BUNDESBANK/BBK01_WT5511.json'
  	@data = data = JSON.parse(open(url).read)

  	@gold_price = @data["dataset"]["data"][0][1]
  end
end
