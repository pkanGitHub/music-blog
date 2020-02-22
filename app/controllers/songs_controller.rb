class SongsController < ApplicationController

    def index
        @songs = current_user.songs
    end

    def new
        @song = current_user.songs.new
    end

    def create
        # byebug
        @song = current_user.songs.new(song_params)
        if @song.save
            redirect_to songs_path
        else
            render :new
        end
    end

    def show
        @song = current_user.songs.find(params[:id])
    
    end

    def edit
        @song = current_user.songs.find(params[:id])
        # if current_user 
    end

    def update
        @song = current_user.songs.find(params[:id])
        if @song.update(song_params)
            # byebug
            redirect_to @song
        else
            # byebug
            render :edit
        end
    end

    def destroy
        @song = current_user.songs.find(params[:id])
        @song.destroy
        redirect_to root_path
    end

    private

    def song_params
        params.require(:song).permit(:artist_name, :title, :genre, :language, :link, song_reviews_attributes: [:review, :user_id, :id]) 
    end
end
