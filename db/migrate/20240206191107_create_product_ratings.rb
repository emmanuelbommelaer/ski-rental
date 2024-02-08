class CreateProductRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :product_ratings do |t|
      t.float :rating
      t.text :comment
      t.references :booking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
