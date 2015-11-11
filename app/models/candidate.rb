class Candidate < ActiveRecord::Base
  has_many :followerCounts, dependent: :destroy
end
