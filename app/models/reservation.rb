class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  
  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true
  
  def room
    return Room.find(self.room_id)
  end
  
  
  
end
