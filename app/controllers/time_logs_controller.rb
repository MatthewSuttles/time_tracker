class TimeLogsController < ApplicationController
  def index
   time_log_setup
  end
  def new

  end
  def create
    params[:time_log][:date] = Date.strptime(params[:time_log][:date], "%m/%d/%Y")
    @time_log = TimeLog.new(time_log_params)
    @time_log.user_id = current_user.id
    if @time_log.save
      time_log_setup
      render partial: "time_logs/team_table"
    else
      render text: "failure"
    end

  end
  def ajax_subcategories
    @subcategories = Category.find(params[:category_id]).subcategories
    @subcategories = [] if @subcategories.count < 1
    render partial: "subcategories/subcategory_picker"
  end

  private

  def time_log_params
    params[:time_log].permit(:team_id, :date, :hours, :minutes, :subcategory_id)
  end

  def time_log_setup
    @user_teams = []
    @time_logs = current_user.time_logs
    @time_log = TimeLog.new
    @user_teams = current_user.teams if current_user.teams.count > 0
    @categories = Category.all.collect{|c| [c.name, c.id] }
  end

  def correct_time

  end
end
