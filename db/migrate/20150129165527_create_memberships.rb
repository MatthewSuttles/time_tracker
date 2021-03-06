class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :team, index: true
      t.belongs_to :user, index: true
      t.boolean :active
      t.timestamps null: false
    end
  end
end
