class FollowerCount < ActiveRecord::Base
  belongs_to :candidate

  def self.update
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
    end

    Candidate.find_each do |c|
      followers_count = client.user(c.twitter_handle).followers_count.to_s
      c.followerCounts.create(twitter_followers: followers_count)
      c.save!
    end
  end
end
