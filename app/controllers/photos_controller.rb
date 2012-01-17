class PhotosController < ApplicationController
  def new
    if current_user.nil?
      redirect_to root_url
    end
     @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.save
    redirect_to root_url
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    session[:return_to] ||= request.referer
    redirect_to session[:return_to]
  end

  def index
    @photos = Photo.all
  end
end
