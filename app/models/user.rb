class User < ActiveRecord::Base
  
  
  has_secure_password
     
  attr_accessible :name, :password_digest,:password_confirmation,:password,
                  :confirmed_at,:confirmation_token,:confirmation_sent_at
  
  name_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, 
    presence: true,
     uniqueness: {:case_sensitive => false}, 
     length: { :maximum => 30 }, 
     format: { :with => name_regex }
  
  validates :password,
    presence: true,
    length: { :within => 8..30 }


  before_save  :generate_token
  after_create :send_confirmation

  
  # Verifies whether a user is confirmed or not
  def confirmed?
    !!confirmed_at
  end   

  protected  
  def generate_token 
    begin
      token = SecureRandom.urlsafe_base64
    end while User.where(:confirmation_token => token).exists?

    self.confirmation_token = token
    self.confirmation_sent_at = Time.now.utc 
  end 

  protected
  def send_confirmation 
    UserMailer.confirmation_email(self).deliver
  end  

end
