require 'twitter'
require 'dotenv'
Dotenv.load('.env')
require 'pry'






# Le @ est important pour définir la variable comme globale et l'utiliser dans la méthode.
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
	



def favorite(client)
	

	client.search("#bonjour_monde", result_type: "recent").take(5).each do |tweet|
		
	client.favorite(tweet)
	end

	#binding.pry
end


favorite(client)