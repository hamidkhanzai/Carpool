class AddColumnToRout < ActiveRecord::Migration
  def change
    add_column :routs, :latitude,  :float #you can change the name, see wiki
    add_column :routs, :longitude, :float #you can change the name, see wiki
    add_column :routs, :gmaps, :boolean
  end
end
