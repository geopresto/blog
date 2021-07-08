class PhotosController < ApplicationController

    def index
        @photos = Photo.all
    end
    
    def show
        @photo = Photo.find(params[:id])
    end
      
    def new
        @photo = Photo.new
    end
    
    def create
        @photo = Photo.new(photo_params)
    
        if @photo.save
          redirect_to @photo
        else
          render :new
        end
    end
    
    def destroy
        @photo = Photo.find(params[:id])
        @photo.destroy
    
        redirect_to root_path
    end

    def image
    end
    
    private

    def photo_params
        params.require(:photo).permit(:title, :description, :date, :image)
    end
end
