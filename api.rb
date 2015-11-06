require 'sinatra'
require "open-uri"

get '/api/:username' do
  username = params['username']
  puts username
  uri = "https://mobile.twitter.com/" + username
  data = URI.parse(uri).read

  # find and pull out the html of the follower line
  #           <div class="statnum">4,710</div>
  is_ready_to_read = false
  html_follower_line = ""

  data.each_line do |line|
    if is_ready_to_read 
      html_follower_line = line
      is_ready_to_read = false
    elsif line.include? '<a href="/' + username + '/followers">'
      is_ready_to_read = true
    end
  end

  # now strip out the html
  number = html_follower_line.scan(/\d/).join('')
  number
end