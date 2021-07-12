class Mypage < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :img, ImgUploader
end
