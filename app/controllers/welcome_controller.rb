class WelcomeController < ApplicationController
  include ActionView::Helpers::NumberHelper
  require 'csv'
  
  def index
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

    c = Candidate.first
    hr.push(c.name)
    r.push(hr)
    c.followerCounts.find_each do |fc|
      r.push([fc.created_at, fc.twitter_followers])
    end

    # Candidate.find_each do |c|
    #   hr.push(c.name)
    #   lastCount = c.followerCounts.last
    #   if hr2.length == 0
    #     hr2.push(lastCount.created_at)
    #   end
    #   hr2.push(lastCount.twitter_followers)
    # end
    # r.push(hr)
    # r.push(hr2)

    # rows = [["date","Patrick"],[20111001,  63.4],[20121001,  70.0]]

    csv = r.map(&:to_csv).join
    render text: csv
  end
end
