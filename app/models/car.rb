class Car < ApplicationRecord
  belongs_to :user
  # has_many_attached :photo
  validates :make, :model, :seats, :price, :location, presence: true
end
