class Proposal < ActiveRecord::Base

  belongs_to :user
  
  has_many :relationships
  has_many :cabinets, :through => :relationships
  has_many :proposal_documents
  
  accepts_nested_attributes_for :proposal_documents
  
  acts_as_taggable_on :tags
  
  validates :title, :presence => true
  validates :description, :presence => true
  validates :user, :presence => true

end