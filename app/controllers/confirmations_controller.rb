class ConfirmationsController < ApplicationController

  # GET /confirmation?confirmation_token=abcdef
  def show
      
    @user = User.find_by_confirmation_token(params[:confirmation_token])   
    if @user.nil?
      redirect_to root_path, notice: "Are you registered? Check email and registration link"  
    else
      if @user.confirmed?
        redirect_to root_path, notice: "You are already confirmed! "  
      else
        @timestamp = Time.now.utc
        @user.update_column(:confirmed_at,@timestamp)
        @user.update_column(:updated_at, @timestamp)
        redirect_to signin_path   notice: "You are confirmed now, please sign in."          
      end
    end 
    
 end



end
