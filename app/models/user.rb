class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
  
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def full_name
    return self.first_name + " " + self.last_name
  end
  
  def admin?
    return self.admin
  end
end
