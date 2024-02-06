class Product < ApplicationRecord
  PRODUCT_CATEGORIES = %w(Ski Snowboard Boots Helmet)
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  include AlgoliaSearch

  algoliasearch index_name: "20240206_ski_products_test" do
    # attributes :name, :category, :details
    tags 'category'
    attributesForFaceting ['searchable(category)']
    numericAttributesForFiltering ['price_per_day']
  end

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: PRODUCT_CATEGORIES }
  validates :details, presence: true
  validates :price_per_day, presence: true, comparison: { greater_than: 0 }
  validates :details, presence: true
  validates :photo, presence: true
end
