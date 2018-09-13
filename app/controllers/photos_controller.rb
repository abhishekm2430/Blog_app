class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to photos_path
  end

  def destroy
  @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:notice] = "Successfully deleted photo!"
      redirect_to photos_path
    else
      flash[:alert] = "Error deleting photo!"
    end
  end

  private 

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
