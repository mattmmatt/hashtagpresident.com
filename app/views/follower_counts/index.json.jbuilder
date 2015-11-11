json.array!(@follower_counts) do |follower_count|
  json.extract! follower_count, :id, :candidate_id, :twitter_follwers
  json.url follower_count_url(follower_count, format: :json)
end
