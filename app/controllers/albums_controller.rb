class AlbumsController < ApplicationController
   before_action :set_artist, only: [:edit, :update, :destroy]
   before_action :set_album, only: [:edit, :update, :destroy]

    def index
        @albums = current_user.albums    
    end

    def show
        if params[:artist_id]
            set_artist
            set_album 
        end     
    end
    
    def edit
    end

    def create
     
        @artist = Artist.find_by_id(params[:artist_id])
        @album = @artist.albums.create(album_params.merge(user_id: current_user.id))
        
        if @album.valid?
            redirect_to @artist, notice: 'Album was successfully created.'
        else
      
            render template: "artists/show"
        end
    end

    def update
        if @album.update(album_params)
            redirect_to @artist, notice: 'Album was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @album.delete
        redirect_to @artist, notice: 'Album was successfully destroyed.'
    end

    def prog_rock
        
        @albums = Album.prog_rock
    end

    private
    
    
    def set_artist
        @artist = Artist.find_by_id(params[:artist_id])
    end
    
    def set_album
        @album = @artist.albums.find_by_id(params[:id])
        
    end
    
    def album_params
        params.require(:album).permit(:title, :year, :genre, :artid_id, :user_id)
    end
end
