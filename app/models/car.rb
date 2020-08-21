class Car < ApplicationRecord
  include Filterable
  belongs_to :user
  has_many :rentals
  has_many :reviews, through: :rentals
  has_many_attached :photos
  validates :make, :model, :seats, :price, :location, presence: true

  def average_rating
    return 0 if self.reviews.length == 0
    review_sum = 0
    review_count = self.reviews.length
    self.reviews.each do |review|
      review_sum += review.rating
    end
    (review_sum / review_count)
  end

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  scope :make, -> (make) { where("make ilike ?", "%#{make}%")}
  scope :min_price, -> (min_price) { where("price > ?", min_price) }
  scope :max_price, -> (max_price) { where("price < ?", max_price) }
  scope :location, -> (location) { where("location ilike ?", "%#{location}%") }


end
