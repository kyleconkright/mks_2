module API
  class UsersController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      render json: User.all
    end

    def show
    	render json: User.find(params[:id])
    end
  end
end
