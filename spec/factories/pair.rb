FactoryGirl.define do
  factory :pair do |f|
    f.brand               'Nike'
    f.nickname            'YOTD'
    f.year                 2012
		f.model								 'Air Force 1'
		f.condition						 9
		f.description					 'ok'
		association   				 :user
  end
end
