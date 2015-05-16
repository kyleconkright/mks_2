class User < ActiveRecord::Base
	has_many :orders
	has_one :address

	validates :name, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	# validates :password, presence: true
end
