class OrdersController < ApplicationController
	
	def auth
		{:password => ENV['scalable_press_test_key']}
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.create
	end

	def get_design_id
		@response = HTTParty.post(
			"https://api.scalablepress.com/v2/design/",
			:headers => {'Content-Type' => 'application/json'},
			:basic_auth => auth,
			:body => {
		    "type":"screenprint",
		    "sides": {
		        "front": {
		          "colors": [
		            "white"
		          ],
		          "dimensions": {
		            "width": 5
		          },
		          "position": {
		            "horizontal": "C",
		            "offset": {
		              "top": 2.5
		            }
		          },
		          "artwork": "http://ga.kyleconkright.com/mks/img.eps"
		        }
		    }
		}.to_json
		)
		return @response["designId"]
	end

	def get_quote
		design_id = get_design_id
		size = params[:size]
		quantity = params[:quantity]

		@response = HTTParty.post(
			"https://api.scalablepress.com/v2/quote/",
			:headers => {'Content-Type' => 'application/json'},
			:basic_auth => auth,
			:body => {
		    "type":"screenprint",
		    "sides":{"front":"1"},
		    "products":[
		        {
		            "id":"american-apparel-50-50-t-shirt",
		            "color":"heather black",
		            "quantity":quantity,
		            "size":size
		        }
		    ],
		    "address": {
		        "name": "My Customer",
		        "address1": "123 Scalable Drive",
		        "city": "West Pressfield",
		        "state": "CA",
		        "zip": "90210",
		        "country": "US"
		    },
		    "designId":design_id
		}.to_json
		)
		@response
		render :json => @response
		@order = Order.create(size: size, quantity: quantity, status: "processing...")
		current_user.orders << @order
	end

	def create_remote_order
		order_token = params[:order_token]
		@response = HTTParty.post(
			"https://api.scalablepress.com/v2/order/",
			:headers => {'Content-Type' => 'application/json'},
			:basic_auth => auth,
			:body => {"orderToken":order_token}.to_json
		)
		@response
		render :json => @response
	end

end
