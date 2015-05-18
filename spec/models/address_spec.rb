require 'rails_helper'

RSpec.describe Address, type: :model do
 it "should have a street1" do 
 	 	address = FactoryGirl.build(:address, street1: "123 main street")
 	 	expect(address.street1).to eq("123 main street")
 	 end
 	 it "should have a street2"do 
 	 	address = FactoryGirl.build(:address, street2: "123 main street")
 	 	expect(address.street2).to eq("123 main street")
 	 end
 	 it "should have a city" do 
 	 	address = FactoryGirl.build(:address, city: "Los Angeles")
 	 	expect(address.city).to eq("Los Angeles")
 	 end
 	 it "should have a state" do 
 	 	address = FactoryGirl.build(:address, state: "CA")
 	 	expect(address.state).to eq("CA")
 	 end

 	 it "should have a zip" do
 	 	address = FactoryGirl.build(:address, zip: 90034)
 	 	expect(address.zip).to eq(90034)
 	 end
 end
