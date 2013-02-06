class User < ActiveRecord::Base
  
  
  has_secure_password
     
  attr_accessible :name, :password_digest,:password_confirmation,:password
  
  name_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, 
    presence: true,
     uniqueness: {:case_sensitive => false}, 
     length: { :maximum => 30 }, 
     format: { :with => name_regex }
  
  validates :password,
    presence: true,
    length: { :within => 8..30 }


   
end
