class AddBookingToRating < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :booking, null: false, foreign_key: true
  end
end
