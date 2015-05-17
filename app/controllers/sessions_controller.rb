class SessionsController < ApplicationController
  def new
  end

  def create
     user = User.find_by(email: params[:login][:email])
     if user && user.authenticate(params[:login][:password])
           session[:user_id] = user.id.to_s
           redirect_to edit_address_path(current_user.address.id)
         else
           redirect_to login_path
         end
   end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
