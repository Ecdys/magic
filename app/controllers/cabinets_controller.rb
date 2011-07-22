class CabinetsController < ApplicationController
before_filter :authenticate_user!
  # GET /cabinets
  # GET /cabinets.json
  
autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'
  
  def index
    
    @cabinets = Cabinet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cabinets }
    end
  end
  
  def search
    with = {}
    with[:tags] = params[:tags] if params[:tags]
    
    @cabinets = Cabinet.search params[:q], :with => with
    @facets = Cabinet.facets params[:q]
    
    @tags = Tag.find @facets[:tags].map{|tag| tag[0] }
  end
  
  # GET /cabinets/1
  # GET /cabinets/1.json
  def show
    @cabinet = Cabinet.find(params[:id])
    
    respond_to do |format|
      format.html do 
        @contacts = @cabinet.contacts
        @implantations = @cabinet.implantations
        @testimonials = @cabinet.testimonials
      end
      format.json { render json: @cabinet }
    end
  end

  # GET /cabinets/new
  # GET /cabinets/new.json
  def new
    @cabinet = Cabinet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cabinet }
    end
  end

  # GET /cabinets/1/edit
  def edit
    @cabinet = Cabinet.find(params[:id])
  end

  # POST /cabinets
  # POST /cabinets.json
  def create
    @cabinet = Cabinet.new(params[:cabinet])
    

    respond_to do |format|
      if @cabinet.save
        current_user.cabinet_id = @cabinet.id
        current_user.save
        format.html { redirect_to @cabinet, notice: 'Cabinet was successfully created.' }
        format.json { render json: @cabinet, status: :created, location: @cabinet }
      else
        format.html { render action: "new" }
        format.json { render json: @cabinet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cabinets/1
  # PUT /cabinets/1.json
  def update
    @cabinet = Cabinet.find(params[:id])

    respond_to do |format|
      if @cabinet.update_attributes(params[:cabinet])
        format.html { redirect_to @cabinet, notice: 'Cabinet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cabinet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabinets/1
  # DELETE /cabinets/1.json
  def destroy
    @cabinet = Cabinet.find(params[:id])
    @cabinet.destroy

    respond_to do |format|
      format.html { redirect_to cabinets_url }
      format.json { head :ok }
    end
  end
end
