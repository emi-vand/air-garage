class Car < ApplicationRecord
  include Filterable
  belongs_to :user
  has_many :rentals
  has_many_attached :photos
  validates :make, :model, :seats, :price, :location, presence: true

  def average_rating
    review_sum = 0
    review_count = 0
    if self.rentals.count == 0
      return 0
      else
      self.rentals.each do |rental|
        review_sum = review_sum + rental.review.rating
        review_count += 1
      end
      return (review_sum / review_count)
    end
  end

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  scope :make, -> (make) { where("make ilike ?", "%#{make}%")}
  scope :min_price, -> (min_price) { where("price > ?", min_price) }
  scope :max_price, -> (max_price) { where("price < ?", max_price) }
  scope :location, -> (location) { where("location ilike ?", "%#{location}%") }


end
