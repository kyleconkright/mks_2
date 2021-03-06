class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			session[:user_id] = @user.id.to_s
			flash[:welcome] = "Thanks for signing up, #{@user.name}! Enter your mailing address!"
			redirect_to new_address_path
		else
			render :new
		end
	end


	private
	def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
