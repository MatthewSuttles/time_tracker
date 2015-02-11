class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.string :description
      t.boolean :active, default: true
      t.belongs_to :category, index: true
      t.timestamps null: false
    end
  end
end
