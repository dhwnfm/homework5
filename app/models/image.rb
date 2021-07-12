class Image < ApplicationRecord
  belongs_to :room, optional: true
  mount_uploader :image_url, ImageUploader
end
