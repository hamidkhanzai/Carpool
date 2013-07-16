class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :number_plate
      t.integer :model
      t.string :company
      t.integer :no_passengers
      t.string :others


      t.timestamps
    end
    add_index :cars,:user_id
  end
end
