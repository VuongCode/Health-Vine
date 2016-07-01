class Snap < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  mount_uploader :video, VideoUploader
end
