require 'twitter'
require 'json'

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
end

file = open("data.json")
json = file.read
parsed = JSON.parse(json)

parsed.each do |user|
  handle = user["Twitter Handle"]
  followers_count = client.user(handle).followers_count.to_s
  printf "%-20s %s\n", handle, followers_count
  user["Followers Count"] = followers_count
end

File.open("data.json","w") do |f|
  f.write(JSON.pretty_generate(parsed))
end
