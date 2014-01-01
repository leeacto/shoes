class Pair < ActiveRecord::Base
	validates_presence_of :brand
	validates_inclusion_of :condition, in: (1..10).to_a
	belongs_to :user
	has_many :photos

end
