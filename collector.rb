require 'twitter'


while true
begin
    config = {
        :consumer_key => "CONSUMER_KEY",
        :consumer_secret => "CONSUMER_SECRET",
        :access_token => "ACCESS_TOKEN",
        :access_token_secret => "ACCESS_TOKEN_SECRET",
    }

    #rClient = Twitter::REST::Client.new config
    sClient = Twitter::Streaming::Client.new(config)

    topics = ['#plazadili', 'plazadili']
    sClient.filter(:track => topics.join(',')) do |tweet|
        if tweet.is_a?(Twitter::Tweet)
          puts "#{tweet.user.screen_name}: #{tweet.text}"
          #rClient.fav tweet
		  #rClient.retweet tweet          
        end
    end
rescue Exception => e
    puts 'error, waiting 2s: ' + e.class.to_s
    sleep 2
end
end