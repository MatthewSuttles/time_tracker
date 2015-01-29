class Team < ActiveRecord::Base
  has_many :users, :through => :memberships
  has_many :memberships

  validates_uniqueness_of :name
  validates_presence_of :name


  def self.active
    self.where(active: true)
  end
end
