class Photo < ApplicationRecord
  belongs_to :place

  mount_uploader :photograph, PhotographUploader
end
