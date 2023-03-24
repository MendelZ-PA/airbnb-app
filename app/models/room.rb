class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :room_images
  has_many :reviews, through: :reservations
end
