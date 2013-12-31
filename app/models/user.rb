require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
	has_many :pairs
	has_many :trackings, class_name: 'Follow', foreign_key: :followed_id, primary_key: :id
	has_many :followings, class_name: 'Follow', foreign_key: :follower_id, primary_key: :id
	has_many :followers, through: :trackings
	has_many :followeds, through: :followings

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
