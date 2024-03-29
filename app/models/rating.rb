class Rating < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :comment, presence: true
end
