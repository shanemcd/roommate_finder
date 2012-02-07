require 'spec_helper'

describe Listing do

  ## I need to figure out how to simulate an image attachment
  before(:each) do  
    @attr = { 
      :name => "Test Listing", 
      :address => "2008 Cedar Grove Rd Winchester VA",
      :latitude => 32.7153292, 
      :longitude => -117.1572551,
      :property_type => "Apartment"
    }
  end  

  it "should create a new listing" do
    Listing.create!(@attr)
  end

  it "should reject listing with no address" do
    no_address_listing = Listing.new(@attr.merge(:address => ""))
    no_address_listing.should_not be_valid
  end

  it "should have a property type" do
    listing = Listing.create!(@attr)
    listing.property_type.should_not be_nil
  end
end