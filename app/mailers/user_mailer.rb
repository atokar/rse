class UserMailer < ActionMailer::Base
  default :from => "notifications@localhost.com"
  
  def confirmation_email(user)
    @user = user
    @url  = "http://localhost:3000/confirmation/#{@user.confirmation_token}"  
    mail(:to => user.name, :subject => "Registered", :from => "admin@localhost.com")  

  end

  def reset_password_email(user)


  end  
    
end
