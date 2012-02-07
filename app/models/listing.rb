class Listing < ActiveRecord::Base
  attr_accessible :photo, :user_id, :name, :address, :latitude, :longitude, :state, :listing_images_attributes, :property_type

  belongs_to :user

  has_many :listing_images, :dependent => :destroy
  accepts_nested_attributes_for :listing_images

  validates :name, :presence => true,
            :length => { :maximum => 50 }

  validates :address, :presence => true,
            :length => { :maximum => 100 }
  
  geocoded_by :address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city =  geo.city
      obj.state =  geo.state
    end
  end
  after_validation :reverse_geocode

  def to_param
    "#{id} #{name}".parameterize
  end

  def shorten_state
    states = {
    "Alabama" => "AL",
    "Alaska" => "AK",
    "Arkansas" => "AR",
    "California" => "CA",
    "Colorado" => "CO",
    "Connecticut" => "CT",
    "Deleware" => "DE",
    "District of Columbia" => "DC",
    "Florida" => "FL",
    "Georgia" => "GA",
    "Hawaii" => "HI",
    "Idaho" => "ID",
    "Illinois" => "IL",
    "Indiana" => "IN",
    "Iowa" => "IA",
    "Kansas" => "KS",
    "Kentucky" => "KY",
    "Louisiana" => "LA",
    "Maine" => "ME",
    "Maryland" => "MD",
    "Massachusetts" => "MA",
    "Michigan" => "MI",
    "Minnesota" => "MN",
    "Mississippi" => "MS",
    "Missouri" => "MO",
    "Montana" => "MT",
    "Nebraska" => "NE",
    "Nevada" => "NV",
    "New Hampshire" => "NH",
    "New Jersey" => "NJ",
    "New Mexico" => "NM",
    "New York" => "NY",
    "North Carolina" => "NC",
    "North Dakota" => "ND",
    "Ohio" => "OH",
    "Oklahoma" => "OK",
    "Oregon" => "OR",
    "Pennsylvania" => "PA",
    "Rhode Island" => "RI",
    "South Carolina" => "SC",
    "South Dakota" => "SD",
    "Tennessee" => "TN",
    "Texas" => "TX",
    "Utah" => "UT",
    "Vermont" => "VT",
    "Virginia" => "VA",
    "Washington" => "WA",
    "West Virginia" => "WV",
    "Wisconsin" => "WI",
    "Wyoming" => "WY"
    }
    if states.has_key?(self.state)
      self.state = states[self.state]
    else
      return self.state
    end
  end

  before_save :shorten_state

end
