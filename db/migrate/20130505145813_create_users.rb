class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :limit=> 40
      t.string :last_name,  :limit=> 40
      t.string :username, :limit => 30
      t.string :password, :limit=> 20
      t.string :email, :limit=>50
      t.string :phone, :limit=>15
      t.integer  :nid_no
      t.integer :licence_no

      t.timestamps
    end
  end
end
