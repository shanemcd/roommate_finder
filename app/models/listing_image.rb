class ListingImage < ActiveRecord::Base
  belongs_to :listing

  has_attached_file :photo,
    :styles => {
      :thumb => "100x70#",
      :small => "300x300>",
      :large => "600x600>",
      :slide => "450x275#"
    }
  
  validates_attachment_size :photo, :less_than=>1.megabyte, :message => "Image needs to be under 1 MB"
end
