class TestimonialsController < ApplicationController
  # GET /testimonials
  # GET /testimonials.json
  def index
    @testimonials = Testimonial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testimonials }
    end
  end

  # GET /testimonials/1
  # GET /testimonials/1.json
  def show
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testimonial }
    end
  end

  # GET /testimonials/new
  # GET /testimonials/new.json
  def new
    @testimonial = Testimonial.new
    # Ajouter le cabinet_id au contact créé
    @testimonial.cabinet_id = params[:cabinet_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @testimonial }
    end
  end

  # GET /testimonials/1/edit
  def edit
    @testimonial = Testimonial.find(params[:id])
  end

  # POST /testimonials
  # POST /testimonials.json
  def create
    @testimonial = Testimonial.new(params[:testimonial])

    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to @testimonial, notice: 'Testimonial was successfully created.' }
        format.json { render json: @testimonial, status: :created, location: @testimonial }
      else
        format.html { render action: "new" }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testimonials/1
  # PUT /testimonials/1.json
  def update
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      if @testimonial.update_attributes(params[:testimonial])
        format.html { redirect_to @testimonial, notice: 'Testimonial was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testimonials/1
  # DELETE /testimonials/1.json
  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy

    respond_to do |format|
      format.html { redirect_to testimonials_url }
      format.json { head :ok }
    end
  end
end
