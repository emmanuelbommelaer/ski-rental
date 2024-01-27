class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :category, presence: true
  validates :details, presence: true
  validates :price_per_day, presence: true, comparison: { greater_than: 0 }
  validates :details, presence: true
end
