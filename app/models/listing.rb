class Listing < ActiveRecord::Base
  attr_accessible :photo, :user_id, :name, :address, :latitude, :longitude, :listing_images_attributes

  belongs_to :user
  
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
    end
    when /arkansas/i
      self.state = "AR"
    end
    when /california/i
      self.state = "CA"
    end
    when /colorado/i
      self.state = "CO"
    end
    when /connecticut/i
      self.state = "CT"
    end
    when /delaware/i
      self.state = "DE"
    end
    when /DC/i
      self.state = "DC"
    end
    when /florida/i
      self.state = "FL"
    end
    when /georgia/i
      self.state = "GA"
    end
    when /hawaii/i
      self.state = "HI"
    end
    when /idago/i
      self.state = "ID"
    end
    when /illinois/i
      self.state = "IL"
    end
    when /indiana/i
      self.state = "IN"
    end
    when /iowa/i
      self.state = "IA"
    end
    when /kansas/i
      self.state = "KS"
    end
    when /kentucky/i
      self.state = "KY"
    end
    when /louisiana/i
      self.state = "LA"
    end
    when /maine/i
      self.state = "ME"
    end
    when /maryland/i
      self.state = "MD"
    end
    when /massachusetts/i
      self.state = "MA"
    end
    when /michigan/i
      self.state = "MI"
    end
    when /minnesota/i
      self.state = "MN"
    end
    when /mississippi/i
      self.state = "MS"
    end
    when /missouri/i
      self.state = "MO"
    end
    when /montana/i
      self.state = "MT"
    end
    when /nebraska/i
      self.state = "NE"
    end
    when /nevada/i
      self.state = "NV"
    end
    when /new hampshire/i
      self.state = "NH"
    end
    when /new jersey/i
      self.state = "NJ"
    end
    when /new mexico/i
      self.state = "NM"
    end
    when /new york/i
      self.state = "NY"
    end
    when /north carolina/i
      self.state = "NC"
    end
    when /north dakota/i
      self.state = "ND"
    end
    when /ohio/i
      self.state = "OH"
    end
    when /oklahoma/i
      self.state = "OK"
    end
    when /oregon/i
      self.state = "OR"
    end
    when /pennsylvania/i
      self.state = "PA"
    end
    when /rhode island/i
      self.state = "RI"
    end
    when /south carolina/i
      self.state = "SC"
    end
    when /south dakota/i
      self.state = "SD"
    end
    when /tennessee/i
      self.state = "TN"
    end
    when /texas/i
      self.state = "TX"
    end
    when /utah/i
      self.state = "UT"
    end
    when /vermont/i
      self.state = "VT"
    end
    when /virginia/i
      self.state = "VA"
    end
    when /washington/i
      self.state = "WA"
    end
    when /west virginia/i
      self.state = "WV"
    end
    when /wisconsin/i
      self.state = "WI"
    end
    when /wyoming/i
      self.state = "WY"
    end
  end

  before_save :shortenState
end
