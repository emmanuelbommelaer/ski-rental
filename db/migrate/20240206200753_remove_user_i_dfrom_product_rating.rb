class RemoveUserIDfromProductRating < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_ratings, :user_id
  end
end
