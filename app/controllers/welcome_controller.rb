class WelcomeController < ApplicationController
  def index
  end

  def data
    r = Array.new
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
    end

    Candidate.find_each do |c|
      ch = Hash.new
      ch[:"Twitter URL"] = c.twitter_url
      ch[:"Name"] = c.name
      ch[:"Party"] = c.party
      ch[:"Twitter URL"] = c.twitter_url
      followers_count = client.user(c.twitter_handle).followers_count.to_s
      ch[:"Followers Count"] = c.followers_count
      r.push(ch)
    end

    render json: r
  end
end
