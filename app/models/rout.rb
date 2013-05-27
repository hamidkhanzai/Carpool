class Rout < ActiveRecord::Base
  attr_accessible :description, :from, :to, :price, :date,:free_seats,:userId ,:car_number, :travel_t
   validates_presence_of :from, :to, :price, :date,:free_seats 
   validates :travel_t, :format => {:with => /^\(?(\d{2})\)?[: ]?(\d{2})$/}, :on => :update
  belongs_to :user
  belongs_to :car
end
