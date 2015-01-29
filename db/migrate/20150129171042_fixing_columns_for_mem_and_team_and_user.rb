class FixingColumnsForMemAndTeamAndUser < ActiveRecord::Migration
  def change
    change_column :memberships, :active, :boolean, default: true
    change_column :teams, :active, :boolean, default: true
    add_column :users, :active, :boolean, default: true
  end
end
