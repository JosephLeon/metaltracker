# README

Metal Tracker is an app for precious metal collectors. Metal tracker keeps track of current precious metal prices, your purchases and profit. There are other features and data.

Currently Metal Tracker only supports silver, gold coming soon.

## Instructions

1. You will need a quandl api key which is free and obtained by signing up at https://www.quandl.com/

2. Add this line to your config/secrets.yml for development and test:
	
	`QUANDL_KEY: YOUR_KEY_HERE`

and this line for production:

	`QUANDL_KEY: <%= ENV["QUANDL_KEY"] %>`

## License

GNU General Public License
