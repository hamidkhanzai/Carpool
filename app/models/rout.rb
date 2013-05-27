class Rout < ActiveRecord::Base
  attr_accessible :description, :d_from, :d_to, :price, :travel_date,:free_seats,:userId ,:car_id, :travel_t
   validates_presence_of :d_from, :d_to, :price, :travel_date,:free_seats 
   validates :travel_t, :format => {:with => /^\(?(\d{2})\)?[: ]?(\d{2})$/}, :on => :update
  belongs_to :user
  belongs_to :car
end
