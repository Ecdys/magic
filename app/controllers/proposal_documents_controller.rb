class ProposalDocumentsController < ApplicationController
  load_and_authorize_resource
  
  def show
    send_file @proposal_document.document.path, :filename => @proposal_document.document.path.split('/').last
  end

end