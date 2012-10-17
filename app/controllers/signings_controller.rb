class SigningsController < ApplicationController
  # GET /signings
  # GET /signings.json
  def index
    @signings = Signing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @signings }
    end
  end

  # GET /signings/1
  # GET /signings/1.json
  def show
    @signing = Signing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @signing }
    end
  end

  # GET /signings/new
  # GET /signings/new.json
  # TBD: rethink how this operation works.
  def new
    @artwork = Artwork.find(params[:signing_id])
    @artwork.signing = Signing.new(params[:signing])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @artwork }
    end
  end

  # GET /signings/1/edit
  def edit
    @signing = Signing.find(params[:id])
  end

  # POST /signing
  # POST /signing.json
  def create
    @signing = Signing.new
    
    # somehow we must create the additional artwork objects for the edition.

    respond_to do |format|
      if @signing.save
        format.html { redirect_to @artwork, :notice => 'Art was successfully created.' }
        format.json { render :json => @artwork, :status => :created, :location => @artwork }
      else
        format.html { render :action => "new" }
        format.json { render :json => @artwork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /signings/1
  # PUT /signings/1.json
  def update
    @artwork = Signing.find(params[:id])

    respond_to do |format|
      if @artwork.update_attributes(params[:artwork])
        format.html { redirect_to @artwork, notice => 'Art was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @artwork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /signings/1
  # DELETE /signings/1.json
  def destroy
    @artwork = Signing.find(params[:id])
    @artwork.destroy

    respond_to do |format|
      format.html { redirect_to artworks_url }
      format.json { head :no_content }
    end
  end
end
