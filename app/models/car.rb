class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many_attached :photos
  validates :make, :model, :seats, :price, :location, presence: true

  def average_rating
    review_sum = 0
    review_count = 0
    self.rentals.map do |rental|
      review_sum = review_sum + rental.review.rating
      review_count = review_count + 1
    end
    (review_sum / review_count)
  end
end
