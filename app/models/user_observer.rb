class UserObserver < ActiveRecord::Observer
  
  def before_create (user)  
    begin
      token = SecureRandom.urlsafe_base64
    end while user.where(:confirmation_token => token).exists?

    user.confirmation_token = token
    user.confirmation_sent_at = Time.now.utc 
  end 
  
  def after_create  (user)
    UserMailer.confirmation_email(@user).deliver
  end

end
