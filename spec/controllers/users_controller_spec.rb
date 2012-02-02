require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end
    
    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h2", :content => @user.name)
    end
    
    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector("img", :class => "user_img")
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      @user = Factory(:user)
    end

    it "should get a user edit page" do
      get :edit, :id => @user
      response.should be_success
    end
  end

  describe "POST 'update'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = { :name => "", :email => "", :password => "", :password_confirmation => "" }
      end
      
      it "should not update a user" do
        lambda do
          post :update, :user => @attr
        end.should_not change(User, :count)
      end
      
      # it "should have the right title" do
      #   post :create, :user => @attr
      #   response.should have_selector("title", :content => "Sign up")
      # end
      
      it "should redirect to the user edit page" do
        post :update, :user => @attr
        response.should redirect_to(edit_user_path)
      end
    end

    describe "success" do

      before(:each) do
        @user = Factory(:user)
        @attr = { :name => "Shane McDonald", :email => "me@shanemcd.com" }
      end

      # it "should change the user" do
      #   post :update, :user => @attr
      #   response.should change(:user)
      # end
    end
  end
end