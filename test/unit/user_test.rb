require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
   
  test "should create a new instance given valid attributes" do
    user = User.new(:name => "TestUser03@domain.com", :password => "TestUser03Pass") 
    assert user.save, "created a new instance with valid attributes"
  end
  
  test "should require a name" do
    user = User.new(:name => "", :password => "TestUser03Pass")
    assert !user.save, "created a new instance with  empty name"
  end
  
  test "should uniqueness name" do
    user = User.new(:name => "FirstUser@domain.com", :password => "TestUser03Pass")
    assert !user.save, "created a new instance with nonunique name"
  end
  

  test "should a name less then 30 symbols" do
    user = User.new(:name => "TestUser04@domain.com"*10, :password => "TestUser03Pass")
    assert !user.save, "created a new instance with name greate then 30 symbols"
  end
  
  test "should require a password" do
    user = User.new(:name => "TestUser05@domain.com", :password => "") 
    assert !user.save, "created a new instance with  empty password"
  end  
end
