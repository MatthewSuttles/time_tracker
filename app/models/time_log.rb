class TimeLog < ActiveRecord::Base

  validates_presence_of :subcategory_id, :date, :user_id
  validates_numericality_of :hours, :minutes
  validates_presence_of :hours, if: Proc.new{|t| t.minutes.blank?}
  validates_presence_of :minutes, if: Proc.new{|t| t.hours.blank?}
  validates_presence_of :team_id, if: Proc.new{|t| t.user.teams.count > 0}

  belongs_to :user
  belongs_to :team
  belongs_to :subcategory

  before_save :correct_time

  def full_time
    return "#{self.hours}h - #{self.minutes}m"
  end

  def correct_time
    unless self.hours.blank?
      if self.hours < 0
        self.hours = 0
      end
    end

    unless self.minutes.blank?
      if self.minutes < 0
        self.minutes = 0
      elsif self.minutes >= 60
        temp_hours = self.minutes / 60
        temp_mins = self.minutes % 60
        self.minutes = temp_mins
        self.hours += temp_hours
      end
    end
  end

end
