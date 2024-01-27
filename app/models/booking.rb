class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :status, presence: true
  validates :start_date, presence: true, comparison: { greater_than: DateTime.current }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
end
