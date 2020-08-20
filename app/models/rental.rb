class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :pick_up, :drop_off, presence: true
  has_one :review
end
