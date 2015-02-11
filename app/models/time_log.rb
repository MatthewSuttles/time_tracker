class TimeLog < ActiveRecord::Base

  validates_presence_of :subcategory_id, :date, :user_id
  validates_numericality_of :hours, :minutes
  validates_presence_of :hours, if: Proc.new{|t| t.minutes.blank?}
  validates_presence_of :minutes, if: Proc.new{|t| t.hours.blank?}
  validates_presence_of :team_id, if: Proc.new{|t| t.user.teams.count > 0}

  belongs_to :user
  belongs_to :team
  belongs_to :subcategory


end
