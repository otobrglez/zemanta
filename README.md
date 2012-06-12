# Ruby client for Zemanta

This GEM provides Ruby client and comand-line tool for Zemanta API.

## Requirements

To use this client you must gain API key. You can get API key
on http://developer.zemanta.com

## Installation

Add this line to your Gemfile
	
	gem 'zemanta'

Or install it as seperate gem

	$ gem install zemanta

## Usage

	zemanta = Zemanta.new "API_KEY_GOES_HERE"
	suggests = zemanta.suggest("My long text goes here...")

	suggests['articles'] 	# All the suggested articles
	suggests['images'] 		# All suggested images
	...


## About

This is unofficial client and comes without any warranty. Please
read and use documentation provided by Zemanta.