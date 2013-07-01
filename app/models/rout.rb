class Rout < ActiveRecord::Base
  acts_as_gmappable  :process_geocoding => false

  attr_accessible :description, :d_from, :d_to, :price, :travel_date,:free_seats,:userId ,:car_id, :travel_t,:latitude,:longitude,:gmaps
   validates_presence_of :d_from, :d_to, :price, :travel_date,:free_seats
   validates :travel_t, :format => {:with => /^\(?(\d{2})\)?[: ]?(\d{2})$/}, :on => :update
  belongs_to :user
  belongs_to :car

  def self.search(search,search1,travel_date)
  if search
    find(:all, :conditions => ['d_from LIKE ? OR d_to LIKE ? OR d_to LIKE ? ', search, search1,travel_date])
  else
     scoped 
  end
end
end
  
     
        
   