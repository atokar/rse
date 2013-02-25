class ConfirmationsController < ApplicationController

  # GET /confirmation?confirmation_token=abcdef
  def create
      
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    if @user
      @user.confirmed_at = Time.now.utc
      @user.save
      redirect_to signin_path   notice: "You are confirmed, please sign in."  
    else
      redirect_to root_path, notice: "You are not confirmed!"   
    
    end

 end



end
