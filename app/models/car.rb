class Car < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :make, :model, :seats, :price, :location, presence: true
end
