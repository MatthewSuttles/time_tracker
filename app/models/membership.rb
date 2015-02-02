class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  validates_uniqueness_of :user_id, scope: :team_id

  def self.active
    self.where(active: true)
  end
  def self.inactive
    self.where(active: false)
  end


end
