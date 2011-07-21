class Proposal < ActiveRecord::Base

  belongs_to :user
  
  has_many :relationships
  has_many :cabinets, :through => :relationships
  
  acts_as_taggable_on :tags
  
  validates :title, :presence => true
  validates :description, :presence => true
  validates :user, :presence => true

end