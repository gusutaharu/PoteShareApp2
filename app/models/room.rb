class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  validates :user_id, presence: true
  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :fee, presence: true
  validates :address, presence: true
  validates :room_img, presence: true
  mount_uploader :room_img, UserImageUploader
  
  def user
    return User.find_by(id: self.user_id)
  end
  
  def self.search(search)
    if search
      Room.where(['address LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end
  
  def self.search_keyword(search_keyword)
    if search_keyword
      Room.where(['address LIKE ? OR room_introduction LIKE ? OR room_name LIKE ?', "%#{search_keyword}%","%#{search_keyword}%","%#{search_keyword}%"])
    else
      Room.all
    end
  end
  
  
  
end
