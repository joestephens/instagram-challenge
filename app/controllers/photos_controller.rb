class PhotosController < ApplicationController
  def index
    @photos = Photo.all.reverse_order
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.create(photo_params)
    redirect_to photos_url
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :image)
  end
end
