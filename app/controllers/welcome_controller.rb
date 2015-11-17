class WelcomeController < ApplicationController
  include ActionView::Helpers::NumberHelper
  require 'csv'
  
  def index
    @last_updated_date = FollowerCount.last.created_at
  end

  def graph
  end

  def data
    r = Array.new

    Candidate.find_each do |c|
      ch = Hash.new
      ch[:"Twitter URL"] = c.twitter_url
      ch[:"Name"] = c.name
      ch[:"Party"] = c.party
      ch[:"Twitter URL"] = "<a href='"+c.twitter_url+"' target='_blank'>" + c.twitter_url + "</a>"
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

  def csv
    r = Array.new
    hr = ["date"]

    date = FollowerCount.first.created_at
    6.times do 
      if r.length == 0
        Candidate.find_each do |c|
          hr.push(c.name)
        end 
        r.push(hr)
      end
      row = Array.new
      row.push(date)

      # add data for each candidate.
      Candidate.find_each do |c|
        # count = c.followerCounts.where("created_at >= #{date}").first.twitter_followers
        fc = c.followerCounts.where("created_at <= ?", date).last
        if fc
          row.push(fc.twitter_followers)
        end
      end 
      if row.count == Candidate.count + 1
        r.push(row)
      end

      date = date + 1.day
    end
    
    csv = r.map(&:to_csv).join
    render text: csv
  end
end
