require "spec_helper"

describe UserMailer do
  
  describe 'confirmations' do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should deliver successfully" do
      lambda { UserMailer.confirmation_email(@user).deliver }.should_not raise_error
    end
  
    it "should be added to the delivery queue" do
       lambda { UserMailer.confirmation_email(@user).deliver }.should change(ActionMailer::Base.deliveries,:size).by(1)
    end   
    

  end
  
end
