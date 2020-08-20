class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :pick_up, :drop_off, presence: true

  has_one :review

  validate :check_time_equality

  def check_time_equality
    if self.pick_up >= self.drop_off
      errors.add(:drop_off, "must be after the start date")
    end
  end
end
