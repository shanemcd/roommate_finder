class Listing < ActiveRecord::Base
  attr_accessible :photo, :user_id, :name, :address, :latitude, :longitude, :state, :listing_images_attributes

  belongs_to :user

  validates :name, :presence => true,
            :length => { :maximum => 50 }

  validates :address, :presence => true,
            :length => { :maximum => 100 }
  
  has_many :listing_images, :dependent => :destroy
  accepts_nested_attributes_for :listing_images

  geocoded_by :address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city =  geo.city
      obj.state =  geo.state
    end
  end
  after_validation :reverse_geocode

  #Embarrassing... Changing this soon.
  def shortenState
    case self.state
    when /alabama/i 
      self.state = "AL"
    when /alaska/i
      self.state = "AK"
    when /arkansas/i
      self.state = "AR"
    when /california/i
      self.state = "CA"
    when /colorado/i
      self.state = "CO"
    when /connecticut/i
      self.state = "CT"
    when /delaware/i
      self.state = "DE"
    when /DC/i
      self.state = "DC"
    when /florida/i
      self.state = "FL"
    when /georgia/i
      self.state = "GA"
    when /hawaii/i
      self.state = "HI"
    when /idago/i
      self.state = "ID"
    when /illinois/i
      self.state = "IL"
    when /indiana/i
      self.state = "IN"
    when /iowa/i
      self.state = "IA"
    when /kansas/i
      self.state = "KS"
    when /kentucky/i
      self.state = "KY"
    when /louisiana/i
      self.state = "LA"
    when /maine/i
      self.state = "ME"
    when /maryland/i
      self.state = "MD"
    when /massachusetts/i
      self.state = "MA"
    when /michigan/i
      self.state = "MI"
    when /minnesota/i
      self.state = "MN"
    when /mississippi/i
      self.state = "MS"
    when /missouri/i
      self.state = "MO"
    when /montana/i
      self.state = "MT"
    when /nebraska/i
      self.state = "NE"
    when /nevada/i
      self.state = "NV"
    when /new hampshire/i
      self.state = "NH"
    when /new jersey/i
      self.state = "NJ"
    when /new mexico/i
      self.state = "NM"
    when /new york/i
      self.state = "NY"
    when /north carolina/i
      self.state = "NC"
    when /north dakota/i
      self.state = "ND"
    when /ohio/i
      self.state = "OH"
    when /oklahoma/i
      self.state = "OK"
    when /oregon/i
      self.state = "OR"
    when /pennsylvania/i
      self.state = "PA"
    when /rhode island/i
      self.state = "RI"
    when /south carolina/i
      self.state = "SC"
    when /south dakota/i
      self.state = "S"
    when /tennessee/i
      self.state = "TN"
    when /texas/i
      self.state = "TX"
    when /utah/i
      self.state = "UT"
    when /vermont/i
      self.state = "VT"
    when /virginia/i
      self.state = "VA"
    when /washington/i
      self.state = "WA"
    when /west virginia/i
      self.state = "WV"
    when /wisconsin/i
      self.state = "WI"
    when /wyoming/i
      self.state = "WY"
    end
  end

  before_save :shortenState
end
