class ListingsController < ApplicationController

  load_and_authorize_resource

  def index
    @listings = Listing.all
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
    redirect_to listings_path
  end

  def destroy
    @listing.destroy
    flash[:notice] = "Successfully destroyed listing."
    redirect_to listings_path
  end

end
