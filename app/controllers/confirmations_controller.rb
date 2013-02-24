class ConfirmationsController < ApplicationController

  # GET /resource/confirmation?confirmation_token=abcdef
  #def create
      
  #    @user = User.find_by_confirmation_token(params[:confirmation_token])
  #    if @user
  #      @user.confirmed_at = Time.now.utc
  #      flash.now[:error] = "You are confirmed, please sign in."   
  #      redirect_to signin_path   
  #    else
  #      redirect_to root_path, notice: "You are not confirmed!"   
  #    end

  #end


  def new 
    flash.now[:error] = "New" 
  end

  def new 
    flash.now[:error] = "NEdit" 
  end
  
  def new 
    flash.now[:error] = "NCreate" 
  end


end
