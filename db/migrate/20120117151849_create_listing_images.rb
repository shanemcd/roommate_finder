class CreateListingImages < ActiveRecord::Migration
  def change
    create_table :listing_images do |t|
      t.string :caption
      t.integer :listing_id

      t.timestamps
    end
  end
end
