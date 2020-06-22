class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]
    
    def index
        @artists = Artist.all
    end
    
    def show
    end
    
    def new
        @artist_options = Artist.all.map{|a| [a.name, a.id ]}
        @artist = Artist.new
        @album = @artist.albums.build    
    end
    
    def edit
    end

    def create    
        @artist = Artist.new(artist_params)
        @artist.albums.last.user_id = current_user.id
        if @artist.save!
            redirect_to @artist, notice: 'Artist was successfully created.'
        else
            render :new
        end
    end

    def update
        
        if @artist.update(artist_params)
            redirect_to @artist, notice: 'Artist was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @artist.destroy
        redirect_to artists_path, notice: "Artist was successfully destroyed."
    end

    private
    
    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :origin, :born, 
        albums_attributes: [
                :title, :year, :genre, :user_id, :id])
    end

end

