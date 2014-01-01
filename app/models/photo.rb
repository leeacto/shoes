class Photo < ActiveRecord::Base
	validations_inclusion_of :url, :ordinal, :pair_id
	default_scope order('ordinal ASC')
end
