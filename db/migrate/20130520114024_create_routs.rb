class CreateRouts < ActiveRecord::Migration
  def change
    create_table :routs do |t|
      t.string :from
      t.string :to
      t.integer :userId
      t.text :description

      t.timestamps
      
    end
    add_index :routs, :userId
  end
end
