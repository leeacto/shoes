require 'spec_helper'

describe User do
	describe '.create' do
		before(:each) do
				@attr = {username: 'test', email: 'test@test.com', password: 'abc123'}
		end

		context 'with valid attribues' do
			it 'creates a new user' do
				expect{User.create(@attr)}.to change(User, :count).by(1)
			end
		end

		context 'with invalid attributes' do
			it 'needs a username' do
				@attr.delete(:username)
				expect{User.create(@attr)}.not_to change(User, :count)
			end

			it 'needs an email' do
				@attr.delete(:email)
				expect{User.create(@attr)}.not_to change(User, :count)
			end
		end
	end
end
