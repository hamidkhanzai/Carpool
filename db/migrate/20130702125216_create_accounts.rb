class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.boolean :license
      t.boolean :privateCar
      t.boolean :checked
      t.boolean :policy
      t.text :description

      t.timestamps
    end
  end
end
