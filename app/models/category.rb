class Category < ActiveRecord::Base
  has_many :subcategoriesß

  validates_presence_of :name


end
