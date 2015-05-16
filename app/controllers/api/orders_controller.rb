module API
  class OrdersController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      render json: Order.all
    end
  end
end
