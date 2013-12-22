require 'spec_helper'

describe Pair do
	describe 'New Pair' do
		before(:each) do
			@user = FactoryGirl.create(:user)
			visit root_path
			click_link 'Log In'
			fill_in 'session_username', with: 'username'
			fill_in 'session_password', with: 'password'
			click_button 'Log In'
			click_link 'Add Shoe'
		end

		context 'with valid attributes' do
			it 'creates a new record' do
				expect{fill_in 'pair_brand', with: 'Nike'
				click_button 'Create Pair'}.to change(Pair, :count).by(1)
			end
		end

		context 'with invalid attributes' do

		end
	end
end
