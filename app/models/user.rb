class User < ActiveRecord::Base
  has_many :listings

  validates :name, :presence => true,
            :length => { :maximum => 50 }

  validates_uniqueness_of :email, :case_sensitive => false


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
    end
  end
end