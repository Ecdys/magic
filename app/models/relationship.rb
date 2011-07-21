class Relationship < ActiveRecord::Base

  belongs_to :cabinet
  belongs_to :proposal
  
  validates :cabinet, :presence => true
  validates :proposal, :presence => true

  validates_uniqueness_of :cabinet_id, :scope => [:proposal_id]
  
end