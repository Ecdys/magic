class ProposalsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @proposals = Proposal.all
    
    respond_to do |format|
      format.html
      format.json do
        render :json => @proposals
      end
    end
  end
  
  def new
    @proposal.proposal_documents.build
  end
  
  def create
    @proposal = Proposal.new params[:proposal].merge(:user_id => current_user.id)
    if @proposal.save
      redirect_to suggest_cabinets_proposal_path(@proposal)
    else
      render :action => :new
    end
  end
  
  def edit
    @proposal.proposal_documents.build
  end
  
  def update
    if @proposal.update_attributes params[:proposal]
      redirect_to proposal_path(@proposal)
    else
      render :action => :edit
    end
  end
  
  def suggest_cabinets
    @cabinets = Cabinet.search :with => { :tags => @proposal.tags.map{|tag| tag.id } }
  end
  
  def create_relationships
    if params[:cabinets] && params[:cabinets].is_a?(Array)
      params[:cabinets].each do |cabinet_id|
        
        Relationship.create :cabinet_id => cabinet_id, :proposal_id => @proposal.id, :status => 'new'
        
      end
    end
    
    redirect_to proposal_path(@proposal)
  end
  
  def show
  
  end

end