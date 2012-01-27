class AddStateToListing < ActiveRecord::Migration
  def change
    add_column :listings, :state, :string

  end
end
