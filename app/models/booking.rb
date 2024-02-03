class Booking < ApplicationRecord
  BOOKING_STATUS = %w(Pending Accepted Declined)
  belongs_to :user
  belongs_to :product

  validates :status, presence: true, inclusion: { in: BOOKING_STATUS }
  validates :start_date, presence: true, comparison: { greater_than_or_equal_to: Date.tomorrow.midnight }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }

  def total_price
    total_price = self.product.price_per_day * ((self.end_date - self.start_date)/86_400).ceil
    final_price = "€#{sprintf('%.2f', total_price)}"
  end
end
