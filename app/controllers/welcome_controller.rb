class WelcomeController < ApplicationController
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
      ch[:"Followers Count"] = c.followers
      r.push(ch)
    end

    render json: r
    # render file: "#{Rails.root}/public/data.json", content_type: "application/json"
  end
end
