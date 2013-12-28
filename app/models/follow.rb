class Follow < ActiveRecord::Base
	validates_presence_of :follower_id, :followed_id
	validates_uniqueness_of :follower_id, :scope => :followed_id
end
