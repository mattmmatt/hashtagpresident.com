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
      ch[:"24change"] = number_with_delimiter(lastCount.twitter_followers - count24HoursAgo.twitter_followers)
      r.push(ch)
    end

    render json: r
  end
end
