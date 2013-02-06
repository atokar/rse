require 'spec_helper'

describe UsersController do
  render_views

  
  describe "GET 'new'" do

    it "should be successful" do
      get :new
      response.should be_success
    end

  
  end
  

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @input_attributes = {
          :name => "",
          :password => "",
          :password_confirmation => ""
        }
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @input_attributes
        end.should_not change(User, :count)
      end


      it "should render the 'new' page" do
        post :create, :user => @input_attributes
        response.should render_template('new')
      end
    end
  end  

  describe "POST 'create'" do

    describe "success" do

      before(:each) do
        @input_attributes = { :name => "NewUser@newmail.com", 
                  :password => "foobar", :password_confirmation => "foobar" }
      end

      it "should create a user" do
        lambda do
          post :create, :user => @input_attributes
        end.should change(User, :count).by(1)
      end

      it "should redirect to the user show page" do
        post :create, :user => @input_attributes
        response.should redirect_to(user_path(assigns(:user)))
      end
    end
  end

end