module UserHelper
	def user_login
		FactoryGirl.create(:user)
		visit login_path
		fill_in 'session_username', with: 'username'
		fill_in 'session_password', with: 'password'
	end
end
