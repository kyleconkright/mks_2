require 'rails_helper'

RSpec.describe User, type: :model do
	it "is should have a name" do
		user = FactoryGirl.build(:user, name: "Mikel")
		expect(user.name).to eq("Mikel")
  end 
  	it "user should have an email" do
		user = FactoryGirl.build(:user, email: "mike@example.com")
		expect(user.email).to eq("mike@example.com")
 	 end
 	#  it "should have a password" do
 	#  	user = FactoryGirl.build(:user, password: "password")
		# expect(user.password).to eq("password")
 	#  end
 	 it "should have a street1" do 
 	 	user = FactoryGirl.build(:user, street1: "123 main street")
 	 	expect(user.street1).to eq("123 main street")
 	 end
 	 it "should have a street2"do 
 	 	user = FactoryGirl.build(:user, street2: "123 main street")
 	 	expect(user.street2).to eq("123 main street")
 	 end
 	 it "should have a city" do 
 	 	user = FactoryGirl.build(:user, city: "Los Angeles")
 	 	expect(user.city).to eq("Los Angeles")
 	 end
 	 it "should have a state" do 
 	 	user = FactoryGirl.build(:user, state: "CA")
 	 	expect(user.state).to eq("CA")
 	 end

 	 it "should have a zip" do
 	 	user = FactoryGirl.build(:user, zip: 90034)
 	 	expect(user.zip).to eq(90034)
 	 end
end

  