class Rout < ActiveRecord::Base
  attr_accessible :description, :from, :to, :userId
  belongs_to :user
end
