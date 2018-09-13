class Photo < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :image
  do_not_validate_attachment_file_type :image
end
