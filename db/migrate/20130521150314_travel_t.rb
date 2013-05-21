class TravelT < ActiveRecord::Migration
  
  def up
     add_column :routs, :travel_t, :time

  end

  def down
  end
end