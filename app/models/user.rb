class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :room,dependent: :destroy
  has_many :reservations
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  mount_uploader :icon_img, UserImageUploader
  
  def rooms
    return Room.where(user_id: self.id)
  end
  
end
