class CreateZones < ActiveRecord::Migration[5.0]
  def change
    create_table :zones do |t|
      t.string :phone
      t.string :address
      t.string :schedule
      t.references :city, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
