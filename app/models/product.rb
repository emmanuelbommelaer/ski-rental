class Product < ApplicationRecord
  PRODUCT_CATEGORIES = %w(Ski Snowboard Boots Helmet)
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  has_many :ratings
  # include AlgoliaSearch

  # algoliasearch do
  #   attributes :name, :category, :details
  #   tags 'category'
  # end

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: PRODUCT_CATEGORIES }
  validates :details, presence: true
  validates :price_per_day, presence: true, comparison: { greater_than: 0 }
  validates :details, presence: true
  validates :photo, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true
end
