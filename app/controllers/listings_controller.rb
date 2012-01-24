class ListingsController < ApplicationController

  layout 'listings'

  load_and_authorize_resource

  def index
    if params[:search].present?
      @listings = Listing.near(params[:search], 50, :order => :distance)
    else
      @listings = Listing.all
  end
  end

  def new
    if current_user.nil?
      redirect_to root_url
    end
    @listing = Listing.new
    authorize! :read, @listing
  end

  def create
    @listing.user = current_user
    if @listing.save
      flash[:notice] = "Successfully created listing."
      redirect_to @listing
    else
      render :action => 'new'
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @photos = @listing.listing_images.all
  end

  def edit
    @listing = Listing.find(params[:id])
    3.times { @listing.listing_images.build }
  end

  def update
    # raise :params
    @listing = Listing.find(params[:id])
    if @listing.update_attributes!(params[:listing])
      flash[:notice] = "Successfully updated listing."
      redirect_to @listing
    else
      render :action => 'edit'
    end
    rescue Exception => e
    flash[:error] = e.message
    redirect_to edit_listing_path(@listing)
  end

  def destroy
    @listing.destroy
    flash[:notice] = "Successfully destroyed listing."
    redirect_to :back
  end

end
