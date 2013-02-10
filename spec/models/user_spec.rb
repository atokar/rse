require 'spec_helper'

describe User do

  before(:each) do
    @input_attributes = {
      name: "testuser@testmail.ru",
      password: "password",
      password_confirmation: "password"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@input_attributes)
  end

  it "should require a name" do
    no_name_user = User.new(@input_attributes.merge(:name => ""))
    no_name_user.should_not be_valid     
  end
  
  it "should reject names that are greater then 30 symbols" do
    long_name = "a" * 31
    long_name_user = User.new(@input_attributes.merge(:name => long_name))
    long_name_user.should_not be_valid
  end 
   
 it "should accept valid names such as name address" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_name_user = User.new(@input_attributes.merge(:name => address))
      valid_name_user.should be_valid
    end
  end

  it "should reject invalid names such as name address" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_name_user = User.new(@input_attributes.merge(:name => address))
      invalid_name_user.should_not be_valid
    end
  end   
  
  it "should reject duplicate names " do
    # Put a user with given name address into the database.
    User.create!(@input_attributes)
    user_with_duplicate_name = User.new(@input_attributes)
    user_with_duplicate_name.should_not be_valid
  end  
 
 it "should reject name identical up to case" do
    upcased_name = @input_attributes[:name].upcase
    User.create!(@input_attributes.merge(:name => upcased_name))
    user_with_duplicate_name = User.new(@input_attributes)
    user_with_duplicate_name.should_not be_valid
  end

 describe "password encryption" do

    before(:each) do
      @user = User.create!(@input_attributes)
    end

    it "should set the assword digest" do
      @user.password_digest.should_not be_blank
    end
  end



   
end