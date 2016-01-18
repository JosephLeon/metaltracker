# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "/tmp/cron_log.log"

every 1.day, :at => '4:00 am' do
	# quandl_key = Rails.application.secrets.QUANDL_KEY
	# # Get and parse silver price data
	# url = 'https://www.quandl.com/api/v1/datasets/LBMA/SILVER.json?api_key=' + quandl_key
	# @silverdata = data = JSON.parse(open(url).read)

	# # Set this days price to a variable
	# @silver_price = @silverdata["data"][0][1]

	# Email with data, will move this to be an active job.
	runner "DataMailer.data_email.deliver_now"
end

every 1.day, :at => '1:44 pm' do
	# quandl_key = Rails.application.secrets.QUANDL_KEY
	# # Get and parse silver price data
	# url = 'https://www.quandl.com/api/v1/datasets/LBMA/SILVER.json?api_key=' + quandl_key
	# @silverdata = data = JSON.parse(open(url).read)

	# # Set this days price to a variable
	# @silver_price = @silverdata["data"][0][1]

	# Email with data, will move this to be an active job.
	runner "DataMailer.data_email.deliver_now"
end

every 2.minutes do
	runner "DataMailer.data_email.deliver_now"
end