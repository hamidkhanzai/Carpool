class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :driver_name
      t.string :driver_lastname
      t.integer :car_number_plate
      t.string :travel_from
      t.string :travel_to
      t.date :travel_date
      t.string :travel_time
      t.text :report_body

      t.timestamps
    end
    add_index :cars, :car_id
  end
end
