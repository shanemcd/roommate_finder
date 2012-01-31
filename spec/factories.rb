FactoryGirl.define do

  factory :user do
    name  "Shane McDonald"
    uid   100002897004783
  end

  factory :listing do
    name  "Beach house"
    latitude 32.7153292
    longitude -117.1572551
    address "San Diego CA"
    city "San Diego"
    state "CA"
  end
end