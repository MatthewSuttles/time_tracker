class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams, :through => :memberships
  has_many :memberships
  
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def full_name
    return self.first_name + " " + self.last_name
  end
  
  def admin?
    return self.admin
  end

  def self.active
    self.where(active: true)
  end
  def self.inactive
    self.where(active: false)
  end
end
