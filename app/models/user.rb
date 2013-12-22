require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
	has_many :pairs

	validates_presence_of :username, :email
	validates_uniqueness_of :username, :email

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	def password
		@password ||= Password.new(password_hash)
  end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
  end
end
