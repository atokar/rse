class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create

    user = User.find_by_name(params[:session][:name])
    if user and user.authenticate(params[:session][:password])
    # If confirmed Sign the user in and redirect to the user's show page.    
      if user.confirmed?
        sign_in user      
        redirect_to user   
      else
        flash.now[:error] = "Check you email and confirm account."   
        redirect_to root_path       
      end       
    else
    # Create an error message and re-render the signin form.       
      flash.now[:error] = "Invalid email/password combination."  
      @title = "Sign in"
      render 'new'   

    end

  end

  def destroy
    sign_out
    redirect_to root_path, notice: "Logout"    
  end
end
