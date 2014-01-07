class Photo < ActiveRecord::Base
	belongs_to :pair
	mount_uploader :shot, ShotUploader

	validates_presence_of :ordinal, :pair_id
	default_scope { order('ordinal ASC') }

end
