class Booking < ApplicationRecord
  BOOKING_STATUS = %w(Pending Accepted Declined)
  belongs_to :user
  belongs_to :product

  validates :status, presence: true, inclusion: { in: BOOKING_STATUS }
  validates :start_date, presence: true, comparison: { greater_than: Date.tomorrow.midnight }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
end
