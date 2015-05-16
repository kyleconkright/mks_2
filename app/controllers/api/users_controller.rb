module API
  class UsersController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      render json: User.all
    end
  end
end
