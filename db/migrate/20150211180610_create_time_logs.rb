class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.belongs_to :team, index: true
      t.belongs_to :user, index: true
      t.belongs_to :subcategory, index: true
      t.date :date
      t.integer :hours
      t.integer :minutes
      t.string :description

      t.timestamps null: false
    end
  end
end
