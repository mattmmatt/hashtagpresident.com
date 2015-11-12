desc "This task is called by the Heroku scheduler add-on"
task :update_follower_counts => :environment do
  puts "Updating follower counts…"
  FollowerCount.update
  puts "done."
end