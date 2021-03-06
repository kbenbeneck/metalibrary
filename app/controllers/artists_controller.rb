class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show]
    
    def index
        @artists = Artist.all
    end
    
    def show
    end
    
    def new
        @artist = Artist.new    
        @album = @artist.albums.build
    end

    def create 
        if params[:artist][:name]
            @artist = Artist.find_or_create_by!(name: artist_params[:name])
            if @artist.save!
                redirect_to @artist
            else
                render 'new'
            end
        else    
           render 'new'
        end
    end

    private
    
    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :origin, :born, :id,
        albums_attributes: [
                :title, :year, :genre, :user_id, :id])
    end

end

