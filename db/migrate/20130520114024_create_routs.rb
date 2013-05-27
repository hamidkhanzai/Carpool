class CreateRouts < ActiveRecord::Migration
  def change
    create_table :routs do |t|
      t.string :d_from
      t.string :d_to
      t.integer :userId
      t.integer :car_id
      t.text :description
      t.integer :free_seats
      t.string :price
      t.date :travel_date
      t.string :travel_t
      t.timestamps
       
    end
    add_index :routs, :userId
    add_index :routs, :car_id
  end
end
