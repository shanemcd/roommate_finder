class User < ActiveRecord::Base
  has_many :listings
  has_one :profile

  validates :name, :presence => true,
            :length => { :maximum => 50 }

  validates_uniqueness_of :email, :case_sensitive => false

  accepts_nested_attributes_for :profile


  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.location = auth["info"]["location"]
      user.image = auth["info"]["image"]
      user.profile = Profile.create
    end
  end
end