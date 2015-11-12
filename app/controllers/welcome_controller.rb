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
      ch[:"Followers Count"] = number_with_delimiter(c.followerCounts.last.twitter_followers)
      r.push(ch)
    end

    render json: r
  end
end
