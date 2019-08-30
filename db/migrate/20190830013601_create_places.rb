class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.text :description
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
