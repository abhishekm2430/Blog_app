class PhotosController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
  end
  def new
    @photo = Photo.new
  end
  def show
    @article = Article.find(params[:article_id])
  end
  def create
    @article = Article.find(params[:article_id])
    @photo = Photo.new(photo_params)
    @photo.imageable = @article
    @photo.save
    redirect_to article_path(@article)
  end

  def destroy
  @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:notice] = "Successfully deleted photo!"
      redirect_to 'https://scotch.io/tutorials/integrating-social-login-in-a-ruby-on-rails-application'
    else
      flash[:alert] = "Error deleting photo!"
    end
  end

  private 

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
