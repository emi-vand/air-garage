class Car < ApplicationRecord
  include Filterable
  belongs_to :user
  has_many :rentals
  has_many_attached :photos
  validates :make, :model, :seats, :price, :location, presence: true

  scope :make, -> (make) { where("make ilike ?", "%#{make}%")}
  scope :min_price, -> (min_price) { where("price > ?", min_price) }
  scope :max_price, -> (max_price) { where("price < ?", max_price) }
  scope :location, -> (location) { where("location ilike ?", "%#{location}%") }

end
