class OrdersController < ApplicationController
	def new
		@user = User.new
	end
end
