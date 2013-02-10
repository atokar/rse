module SessionsHelper

  def sign_in(user)

    session[:current_user_id] = user.id    

  end

  def current_user

    @current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])

  end

  def signed_in?

    !current_user.nil?

  end  
  
  def sign_out

    @current_user = session[:current_user_id] = nil

  end
    
end
