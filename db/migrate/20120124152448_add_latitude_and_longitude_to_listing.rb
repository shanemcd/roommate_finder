class AddLatitudeAndLongitudeToListing < ActiveRecord::Migration
  def change
    add_column :listings, :latitude, :float

    add_column :listings, :longitude, :float

  end
end
