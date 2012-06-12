# Ruby client for Zemanta

This Gem provides Ruby client and comand-line tool for Zemanta API.

## Requirements

To use this client you must gain API key.
You can get API key on http://developer.zemanta.com

## Installation

Add this line to your Gemfile
	
	gem 'zemanta'

Or install it as seperate gem

	$ gem install zemanta

## Using Zemanta from comand-line

After installing the Gem create file ~/.zemanta with API key.

	ZEMANTA_KEY="xxx"

For comand-line usage use command -h. You will get following output...

	Usage: zemanta COMMAND [options]

	Commands
		suggest: Suggest method allows to query Zemanta for contextual metadata about a given text.
	Options
	    -h, --help                       help
	    -a, --api_key NEW_KEY            Zemanta api_key
	    -t, --text TEXT                  Text to work on
	    -f, --file FILE                  File to work on
	    -m, --mtype TYPE                 Output type (JSON or RB)
	    -r, --result_field FIELD         Result field

Usage example would be...

	zemanta suggest -f test_file.txt -r articles -m json

## Using Zemanta in your Ruby application

You can use client from your Ruby code or from comand-line.

### Configuration

Zemanta API requires API key, so to use this client you also have to set the key. You can do this like so...

	zemanta = Zemanta.new "API_KEY_GOES_HERE"

Or if you like class wide key...

	Zemanta.api_key = "API_KEY_GOES_HERE"

The 3rd option is to set enviroment variable "ZEMANTA_KEY" and client will pick it up.

### Suggests with #suggest method

Zemanta API provides 3 methods; and so does this client.
You can use suggest method like so...

	suggests = Zemanta.new.suggest("My long text goes here...")

	suggests['articles'] 	# All the suggested articles
	suggests['images'] 		# All suggested images
	...

For more information and structure look at this #suggest resource.

http://developer.zemanta.com/docs/suggest/

### Suggests with #suggest_markup

In comparison to #zemanta_suggest, this method returns only links to semantical entities.

	suggests = Zemanta.new.suggest_markup("My long text goes here...")
	suggests['markup']

For more information about this response see suggest_markup method documentation.

http://developer.zemanta.com/docs/suggest_markup/

### #preferences method

Method #preferences allows Zemanta API users to get preferences of specific user. 

	me = Zemanta.new.preferences
	me['user']	# Get nice key...

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

## Limits

Your daily limit is set at 1.000 calls per day. Send email to support@zemanta.com to make it 10.000 calls per day.

## Testing and developement

Client is tested/build with RSpec with help of Guard, but it does NOT use mockups or anything like that. For testing and developement you must get your own Zemanta API Key.

## About

This is unofficial client and comes without any warranty. Please
read and use documentation provided by Zemanta.

## Contribution and authors

Oto Brglez / @otobrglez / <oto.brglez@opalab.com>