require "zemanta/version"
require "httparty"

class Zemanta
	include HTTParty
	base_uri 'http://api.zemanta.com'

	# api_key for Zemanta
	@@api_key=nil
	def self.api_key=(key); @@api_key=key end
	def self.api_key; @@api_key end
	def api_key; Zemanta.api_key end

	# Initialize the client
	def initialize(api_key=nil)
		@@api_key = api_key unless api_key.nil?
		@@api_key = ENV["ZEMANTA_KEY"] if @@api_key.nil? and not(ENV["ZEMANTA_KEY"].nil?)
	end

	# Provide contextual metadata about text
	# http://developer.zemanta.com/docs/suggest/
	def suggest text, options={}
		get("suggest",options.merge!({
			text: text
		}))
	end

	# Suggest method allows developers to query Zemanta
	# for contextual metadata on a given text.
	# In comparison to zemanta.suggest, this method returns
	# only links to semantical entities.
	def suggest_markup text, options={}

	end

	# TODO: Implement...
	def preferences
	end

	# Get REST service with JSON response
	def get(method,options)
		options.merge!({
			method: "zemanta.#{method}", api_key: @@api_key,
			format: "json"})

		handle_response(
			self.class.get('/services/rest/0.0/',query:options),
		options)
	end

	# Handle response from service
	def handle_response response, options={}
		unless response['status'] =~ /ok/
			msg = response.parsed_response.match("<h1>(.+?)</h1>")[1]
			msg = "Error." if msg.nil?
			throw "Zemanta: %s" % msg
		end

		response
	end
end
