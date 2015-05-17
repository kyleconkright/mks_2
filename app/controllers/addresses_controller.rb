class AddressesController < ApplicationController
	def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)

		if @address.save
			current_user.address = @address
			redirect_to new_order_path
	    else
	    	render :new
	    end
	end

	def edit
	  @address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		@address.update_attributes(address_params)
		redirect_to new_order_path
	end

	private
	def address_params
	  params.require(:address).permit(:street1, :street2, :city, :state, :zip)
	end
end
