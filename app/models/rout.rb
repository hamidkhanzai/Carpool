class Rout < ActiveRecord::Base
  attr_accessible :description, :from, :to, :price, :date,:free_seats,:userId ,:car_number, :travel_t
   validates_presence_of :from, :to, :price, :date,:free_seats 
  belongs_to :user
  belongs_to :car
end
