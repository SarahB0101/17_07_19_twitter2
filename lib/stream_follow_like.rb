require 'twitter'
require 'dotenv'
Dotenv.load('.env')
require 'pry'






# Le @ est important pour définir la variable comme globale et l'utiliser dans la méthode.

	
def login_twitter
	client_rest = Twitter::REST::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end
	client_rest
end


def login_twitter_stream	
	client_stream = Twitter::Streaming::Client.new do |config|
	  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
	  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
	  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
	  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
	end
	client_stream
end




def favorite_follow(client_rest, client_stream)
	

	client_stream.filter(:track => "#bonjour_monde") do |tweet|
		client_rest.favorite(tweet)
		client_rest.follow(tweet.user)

	end

	#binding.pry
end


def perform
	client_rest = login_twitter
	client_stream = login_twitter_stream
	favorite_follow(client_rest, client_stream)
end	


perform

