class Product < ApplicationRecord
  PRODUCT_CATEGORIES = %w(Ski Snowboard Boots Helmet)
  INDEX = ENV["ALGOLIA_INDEX"]

  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  has_many :ratings

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: PRODUCT_CATEGORIES }
  validates :details, presence: true
  validates :price_per_day, presence: true, comparison: { greater_than: 0 }
  validates :details, presence: true
  validates :photo, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true

  include AlgoliaSearch

  algoliasearch index_name: INDEX  do
    add_attribute :image_url do
      photo.url
    end

    add_attribute :address do
      self.user.address.split.last
    end

    add_attribute :latitude do
      self.user.latitude
    end

    add_attribute :longitude do
      self.user.longitude
    end


    searchableAttributes ['name', 'category', 'details', 'address']

    attributesForFaceting ['category', 'address']
    numericAttributesForFiltering ['price_per_day', 'rating']

    customRanking ['desc(rating)']
  end

end
