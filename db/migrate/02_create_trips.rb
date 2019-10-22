class CreateTrips < ActiveRecord::Migration[5.2]
  def change 
    create_table :trips do |t|
      t.string :origin
      t.string :destination
      t.datetime :trip_date
      t.float :fare
      t.boolean :active
      t.timestamps
    end
  end
end