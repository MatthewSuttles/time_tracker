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
    @team_users = @team.users.active
  end

  def update
  @team = Team.find(params[:id])
    @team.update_attributes(team_params)
    flash[:notice] =  "Team Updated Successfully"
    redirect_to edit_team_path(@team)
  end

private
  def team_params
    params[:team].permit(:name, :active)
  end


end
