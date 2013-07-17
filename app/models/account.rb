class Account < ActiveRecord::Base
  attr_accessible :checked, :description, :license, :policy, :privateCar
  validates_presence_of :description,:policy
  belongs_to :user
end
