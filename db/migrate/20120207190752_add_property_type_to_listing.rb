class AddPropertyTypeToListing < ActiveRecord::Migration
  def change
    add_column :listings, :property_type, :string

  end
end
