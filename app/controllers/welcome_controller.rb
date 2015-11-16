class WelcomeController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
  def index
  end

  def data
    r = Array.new

    Candidate.find_each do |c|
      ch = Hash.new
      ch[:"Twitter URL"] = c.twitter_url
      ch[:"Name"] = c.name
      ch[:"Party"] = c.party
      ch[:"Twitter URL"] = c.twitter_url
      lastCount = c.followerCounts.last
      ch[:"Followers Count"] = number_with_delimiter(lastCount.twitter_followers)
      count24HoursAgo = c.followerCounts.where("created_at >= ?", lastCount.created_at - 24.hours).first
      hourCountChange = lastCount.twitter_followers - count24HoursAgo.twitter_followers
      percent24HoursAgo = number_to_percentage(hourCountChange.to_f / lastCount.twitter_followers, precision: 2)
      ch[:"24change"] = number_with_delimiter(hourCountChange)
      ch[:"24change Percent"] = percent24HoursAgo
      r.push(ch)
    end

    render json: r
  end
end
