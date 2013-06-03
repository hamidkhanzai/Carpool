class Car < ActiveRecord::Base
  attr_accessible :number_plate,:photo,:no_passengers,:others,:model,:company,:user_id

  belongs_to :user
  has_many :routs
  has_attached_file :photo
  validates_uniqueness_of :number_plate




end
