require 'twitter'


while true
begin
    config = {
        :consumer_key => "jqntMvc9fDvunCtysHCqxm2WF",
        :consumer_secret => "6klAKtqA4DVR6EYIv2UCdWfUQuaPP2oH4x45R0BcfcWr81k4U7",
        :access_token => "45805555-re0887EiW6oiV86DPZsKQDo1433dXxqZsq2N74yyz",
        :access_token_secret => "e498dduxRYTC0OzAbnJNo8Q5GZjcFJOmqfHgwVsgpThHY",
    }

    #rClient = Twitter::REST::Client.new config
    sClient = Twitter::Streaming::Client.new(config)

    topics = ['#plazadili', 'plaza']
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