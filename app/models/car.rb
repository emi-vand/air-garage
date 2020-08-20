class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many_attached :photos
  validates :make, :model, :seats, :price, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
