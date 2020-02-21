class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to songs_path
        else
            render :new
        end
    end

    def show
        @song = Song.find(params[:id])
        # p "ID: #{song.id}"
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        if @song.destroy
            redirect_to root_path, :notice => "Your song has been deleted Successfully."
        else
            redirect_to @song
        end
    end

    private

    def song_params
        params.require(:song).permit(:artist_name, :title, :genre, :language, :link) 
    end
end
