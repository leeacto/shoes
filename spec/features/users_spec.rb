include UserHelper
require 'spec_helper'

describe User do
	describe 'signup' do
		context 'successfully' do
			it 'creates a new user' do
				visit root_path
				click_link 'Sign Up'
				expect {
					fill_in 'Username', with: 'Nick'
					fill_in 'Email', with: 'test@test.com'
					fill_in 'Password', with: 'abc123'
					click_button 'Create User'
				}.to change(User, :count).by(1)
			end
		end
	end
	
	describe 'following' do
		before(:each) do
			user_login
		end

		it 'follows a user' do
		end
	end
end
