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
 	 
end

  