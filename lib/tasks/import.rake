require "open-uri"

namespace :import do
  desc "Import into the DB from the data.json"
  task import_json: :environment do
    Candidate.delete_all

    parsed = JSON.parse open("https://script.google.com/macros/s/AKfycbzoWAagihLaM_SLCXrHp5tUW1Q6XSnpEc1J9DHaz5FM6Gk9V1Ci/exec").read

    parsed.each do |user|
      c = Candidate.new
      c.name = user["Name"]
      c.party = user["Party"]
      c.twitter_handle = user["Twitter Handle"]
      c.twitter_url = user["Twitter URL"]
      c.followers = user["Followers Count"]
      puts c
      c.save
    end

  end

end
