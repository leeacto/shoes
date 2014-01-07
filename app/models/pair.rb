class Pair < ActiveRecord::Base
	belongs_to :user
	has_many :photos
	
	validates_presence_of :brand
	validates_inclusion_of :condition, in: (1..10).to_a

	scope :for_sale, -> {where(available: true)}

	def thumb_url
		if !self.photos.empty?
			self.photos.first.shot_url(:thumb)
		else
			'http://cdn.niketalk.com/1/14/200x200px-ZC-14023d85_Air-Jordan-1-OG_1350815876.jpeg'
		end
	end
end
