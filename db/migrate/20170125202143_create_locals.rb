class CreateLocals < ActiveRecord::Migration[5.0]
  def change
    create_table :locals do |t|
      t.string :phone
      t.string :schedule
      t.references :restaurant, foreign_key: true
      t.references :zone, foreign_key: true

      t.timestamps
    end
  end
end
