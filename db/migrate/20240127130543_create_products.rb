class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.float :price_per_day
      t.text :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
