class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :team


  def self.active
    self.where(active: true)
  end
end
