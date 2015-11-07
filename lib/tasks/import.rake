namespace :import do
  desc "Import into the DB from the data.json"
  task import_file: :environment do
    Candidate.delete_all

    file = open("Public/data.json")
    json = file.read
    parsed = JSON.parse(json)

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
