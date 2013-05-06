class User < ActiveRecord::Base
   attr_accessible :first_name, :last_name,:username,:password,:email,:nid_no,:licence_no,:phone
  validates_presence_of :first_name, :last_name,:username,:password,:email,:nid_no,:licence_no,:phone
  validates_uniqueness_of :username
end
