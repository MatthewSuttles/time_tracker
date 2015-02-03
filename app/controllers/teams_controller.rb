class TeamsController < ApplicationController

  def index
  @teams = Team.all
  end

  def new
  @team = Team.new
  end

  def create
  @team = Team.new(team_params)
  @team.save
  flash[:notice] =  "Team Created Successfully"
  redirect_to edit_team_path(@team.id)

  end

  def edit
  @team = Team.find(params[:id])
  @team_users = @team.active_users
    @users = User.all.active
  end

  def update
  @team = Team.find(params[:id])
    @team.update_attributes(team_params)
    flash[:notice] =  "Team Updated Successfully"
    redirect_to edit_team_path(@team)
  end

  def ajax_add_user
    @team = Team.find(params[:team])
    @user = User.find(params[:user])

    if @team.users.exists?(params[:user])
      #if the user is inactive with the team then make them active
      temp = @team.memberships.where(user_id: params[:user])
      temp[0].active = true
      temp[0].save
    else
      @team.users << @user
    end

    @team_users = @team.active_users
    respond_to do |wants|
      wants.json{render json: @user.as_json}
    end
  end

  def ajax_remove_user
    @team = Team.find(params[:team])
    @user = User.find(params[:user])

    temp = @team.memberships.where(user_id: params[:user])
    temp[0].active = false
    temp[0].save

    @team_users = @team.active_users
    respond_to do |wants|
      wants.json {render json: @user.as_json}
    end
  end
private
  def team_params
    params[:team].permit(:name, :active)
  end


end
