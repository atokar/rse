require 'spec_helper'

describe User do

  before(:each) do
    @input_attributes = {
      name: "TestUser@test.com",
      password: "TestUserPass",
      password_confirmation: "TestUserPass"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@input_attributes)
  end

  it "should require a name" do
    no_name_user = User.new(@input_attributes.merge(:name => ""))
    no_name_user.should_not be_valid
  end
end