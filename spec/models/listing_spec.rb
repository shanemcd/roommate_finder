require 'spec_helper'

describe User do

  before(:each) do  
    @attr = { 
      :name => "Test Listing", 
      :address => "2008 Cedar Grove Rd Winchester VA"
    }
  end  

  it "should create a new listing" do
    Listing.create!(@attr)
  end

  it "should reject listing with no address" do
    no_address_listing = Listing.new(@attr.merge(:address => ""))
    no_address_listing.should_not be_valid
  end

  
end