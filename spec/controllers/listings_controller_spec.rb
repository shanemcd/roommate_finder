require 'spec_helper'

describe ListingsController do
  render_views

  describe "GET 'listing'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should have the right title" do
        get 'index'
        response.should have_selector("title", :content => "RoomFinder")
    end
  end

  describe "GET 'edit'" do

    it "should get the edit page for a listing" do
      
    end
  end
end