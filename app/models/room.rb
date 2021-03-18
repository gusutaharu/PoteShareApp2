class Room < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :fee, presence: true
  validates :address, presence: true
  validates :room_img, presence: true
  mount_uploader :room_img, UserImageUploader
end
