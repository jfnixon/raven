class LimitedEditionsController < ApplicationController
  # GET /limited_editions
  # GET /limited_editions.json
  def index
    @limited_editions = LimitedEdition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @limited_editions }
    end
  end

  # GET /limited_editions/1
  # GET /limited_editions/1.json
  def show
    @limited_edition = LimitedEdition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @limited_edition }
    end
  end

  # GET /limited_editions/new
  # GET /limited_editions/new.json
  def new
    @limited_edition = LimitedEdition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @limited_edition }
    end
  end

  # GET /limited_editions/1/edit
  def edit
    @limited_edition = LimitedEdition.find(params[:id])
  end

  # POST /limited_editions
  # POST /limited_editions.json
  def create
    @limited_edition = LimitedEdition.new(params[:limited_edition])

    respond_to do |format|
      if @limited_edition.save
        format.html { redirect_to @limited_edition, notice: 'Limited edition was successfully created.' }
        format.json { render json: @limited_edition, status: :created, location: @limited_edition }
      else
        format.html { render action: "new" }
        format.json { render json: @limited_edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /limited_editions/1
  # PUT /limited_editions/1.json
  def update
    @limited_edition = LimitedEdition.find(params[:id])

    respond_to do |format|
      if @limited_edition.update_attributes(params[:limited_edition])
        format.html { redirect_to @limited_edition, notice: 'Limited edition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @limited_edition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /limited_editions/1
  # DELETE /limited_editions/1.json
  def destroy
    @limited_edition = LimitedEdition.find(params[:id])
    @limited_edition.destroy

    respond_to do |format|
      format.html { redirect_to limited_editions_url }
      format.json { head :no_content }
    end
  end
end
