class Listing < ActiveRecord::Base
  attr_accessible :photo, :user_id, :name, :address, :latitude, :longitude, :listing_images_attributes

  belongs_to :user
  
  has_many :listing_images, :dependent => :destroy
  accepts_nested_attributes_for :listing_images

  geocoded_by :address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city    = "#{geo.city} #{geo.state}"
    end
  end
  after_validation :reverse_geocode
end
