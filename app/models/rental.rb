class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :pick_up, presence: true
  
end
