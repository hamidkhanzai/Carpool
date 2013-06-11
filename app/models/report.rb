class Report < ActiveRecord::Base
  attr_accessible :car_number_plate, :driver_lastname, :driver_name, :report_body, :travel_date, :travel_from, :travel_time, :travel_to
  belongs_to :car
  
  def self.search(search)
  if search
    find(:all, :conditions => ['driver_name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end
end
