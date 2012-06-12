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

## Using Zemanta in your application

You can you client from your Ruby code or from comand line.

### Configuration

Zemanta API requires API key, so to use this client you also have to set the key. You can do this like so...

	zemanta = Zemanta.new "API_KEY_GOES_HERE"

Or if you like class wide key...

	Zemanta.api_key = "API_KEY_GOES_HERE"

The 3rd option is to set enviroment variable "ZEMANTA_KEY" and client will pick it up.

### Suggests

Zemanta API provides 3 methods; and so does this client.
You can use suggest method like so...

	z = Zemanta.new.suggest("My long text goes here...")

	suggests['articles'] 	# All the suggested articles
	suggests['images'] 		# All suggested images

	suggests['markup']
	suggests['signature']
	suggests['keywords']
	suggests['rid']
	suggests['categories']
	suggests['rich_objects']

For more information and structure look at this resource:
http://developer.zemanta.com/docs/suggest/

### Client options

Zemanta API methods also provide some additional options. You can use them like so:

	suggests = z.suggest("
		Some text here...
	",{
		return_images: 0,	# Don't return any images.
		articles_limit: 2 	# Limit of articles returned
	})

For more options please read:
http://developer.zemanta.com/docs/suggest/

## About

This is unofficial client and comes without any warranty. Please
read and use documentation provided by Zemanta.