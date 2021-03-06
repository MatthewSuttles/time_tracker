class Subcategory < ActiveRecord::Base

  belongs_to :category
  has_many :time_logs

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :category_id


  def active?
    return self.active
  end

  def self.active
    self.where(active: true)
  end
  def self.inactive
    self.where(active: false)
  end

end
