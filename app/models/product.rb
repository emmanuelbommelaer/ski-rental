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

  def booked_dates
    output = []
    self.bookings.each do |b|
      date = b.start_date
      while date < b.end_date
        output << date
        date = date.next_day
      end
    end
    return output
  end

  def average_rate
    all_ratings = []
    self.bookings.each do |b|
      if b.rating
        all_ratings << b.rating.rating
      end
    end
    if all_ratings.empty?
      return ""
    else
      all_ratings.inject{ |sum, el| sum + el }.to_f / all_ratings.size
    end
    # define method to calculate average_rate from all Bookings of a Product
  end
end
