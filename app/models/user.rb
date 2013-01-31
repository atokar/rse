class User < ActiveRecord::Base
  
  attr_accessible :name, :password
  
  name_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, 
    presence: true, 
    uniqueness: {:case_sensitive => false}, 
    length: { :maximum => 30 }, 
    format: { :with => name_regex }
  
  validates :password, 
    presence: true
  # has_secure_password
   
end
