class User < ActiveRecord::Base

  has_many :cars
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name,:username,:nid_no,:licence_no,:phone

  validates_presence_of :first_name, :last_name,:username,:nid_no,:licence_no, :on=> :update
  validates_uniqueness_of :username, :on => :update

  validates :phone, :format => {:with => /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/}, :on => :update

   has_many :routs


  #require 'digest/sha1'
=begin
   if email==nil?
   attr_accessible :first_name, :last_name,:username,:email,:password,:nid_no,:licence_no,:phone,:password_confirmation

  validates_presence_of :first_name, :last_name,:username,:nid_no,:licence_no
  validates_uniqueness_of :username
  validates_numericality_of(:phone)
  validates :phone, :format => {:with => /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/}

   end
=end
=begin
   before_save :make_salt, :create_hash



  def make_salt
    self.salt=Digest::SHA1.hexdigest("#{username} and #{Time.now}")
  end

  def create_hash
    self.password=Digest::SHA1.hexdigest("#{password}#{salt}")

  end
=end
end
