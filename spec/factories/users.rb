FactoryGirl.define do
  factory :user do |f|
    f.username               'username'
    f.email                  'email@email.com'
    f.password               'password'
		f.admin									 false
  end

  factory :admin, class: User do |f|
    f.username               'username'
    f.email                  'email@email.com'
    f.password               'password'
		f.admin									 false
  end
end
