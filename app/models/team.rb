class Team < ActiveRecord::Base
  has_many :users, :through => :memberships
  has_many :memberships

  validates_uniqueness_of :name
  validates_presence_of :name


  def self.active
    self.where(active: true)
  end

  def active_users
    temp = self.memberships.where(active: true)
    users = []
    temp.each do |user|
      temp_user = User.find(user.user_id)
      users << temp_user if temp_user.active
    end
    return users
  end
end
