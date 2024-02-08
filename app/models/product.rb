class Product < ApplicationRecord
  PRODUCT_CATEGORIES = %w(Ski Snowboard Boots Helmet)
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :sku, presence: true
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: PRODUCT_CATEGORIES }
  validates :details, presence: true
  validates :price_per_day, presence: true, comparison: { greater_than: 0 }
  validates :details, presence: true
  validates :photo, presence: true

  def blob_url(blob)
    Rails.application.routes.url_helpers.rails_blob_url(blob, only_path: true)
  end

  def get_image_url
    return blob_url(photo) if photo.attached?
  end

  include AlgoliaSearch

  algoliasearch index_name ENV["ALGOLIA_INDEX"] do
    add_attribute :image_url do
      photo.url
    end
    # tags ['category']
    attributesForFaceting ['searchable(category)']
    numericAttributesForFiltering ['price_per_day']
  end

end
