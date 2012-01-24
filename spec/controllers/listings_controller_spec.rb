require 'spec_helper'

describe ListingsController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
        get 'home'
        response.should have_selector("title", :content => "Ruby on Rails Tutorial Sample App | Home")
    end
  end
end