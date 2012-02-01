class AddAboutToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :about, :text

  end
end
