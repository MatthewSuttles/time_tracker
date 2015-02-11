class TimeLogsController < ApplicationController
  def index
    @teams = []
    @time_logs = current_user.time_logs
    @time_log = TimeLog.new
    @teams = current_user.teams if current_user.teams.count > 0
    @categories = Category.all.collect{|c| [c.name, c.id] }

  end
end
