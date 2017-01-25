class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :img_url
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
