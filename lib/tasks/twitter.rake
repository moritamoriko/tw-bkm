namespace :twitter do
  desc "favoを取得する"
  task :getfavo => :environment do
    ## アプリ登録時に取得したCONSUMER_KEY/CONSUMER_SECRET
    CONSUMER_KEY = Rails.application.secrets.tw_consumer_key
    CONSUMER_SECRET = Rails.application.secrets.tw_consumer_secret
    ## irbで取得したAccess Token/Access Secret
    OAUTH_TOKEN = Rails.application.secrets.tw_oauth_token
    OAUTH_TOKEN_SECRET = Rails.application.secrets.tw_oauth_token_secret

    client = Twitter::REST::Client.new do |config|
      config.consumer_key       = CONSUMER_KEY
      config.consumer_secret    = CONSUMER_SECRET
      config.oauth_token        = OAUTH_TOKEN
      config.oauth_token_secret = OAUTH_TOKEN_SECRET
    end

    timeline = client.favorites("moriko_o")

    timeline.each do |tweet|
      puts "-----ツイート-------"
      puts tweet.text
      #puts "-----お気に入り数----"
      #puts tweet.favorite_count
      #puts "-----リツイート数-----"
      #puts tweet.retweet_count
      puts "=================="
    end
  end
end
