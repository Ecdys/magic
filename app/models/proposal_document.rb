class ProposalDocument < ActiveRecord::Base

  belongs_to :proposal

  validates_presence_of :document

  mount_uploader :document, DocumentUploader

end