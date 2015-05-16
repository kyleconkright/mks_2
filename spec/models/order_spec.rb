require 'rails_helper'

RSpec.describe Order, type: :model do
	it "should have QTY"  do
	order = FactoryGirl.build(:order, quantity: 1)
	expect(order.quantity).to eq(1)
	end 
	it "should have status"  do
	order = FactoryGirl.build(:order, status: "pending")
	expect(order.status).to eq("pending")
	end 
	it"should have size" do 
	order = FactoryGirl.build(:order, size: "small")
	expect(order.size).to eq("small")
	end 
end
