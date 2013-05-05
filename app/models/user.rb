class User < ActiveRecord::Base
   attr_accessible :first_name, :last_name,:username,:password,:email,:nid_no,:licence_no,:phone
end
