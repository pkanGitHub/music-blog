class SongsController < ApplicationController


    def index
        user = params[:user_id]
        @songs = user ? current_user.songs : Song.all
        # @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        # byebug
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
            # byebug
            redirect_to @song
        else
            # byebug
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        
        redirect_to root_path
    end

    private

    def song_params
        params.require(:song).permit(:artist_name, :title, :genre, :language, :link, song_reviews_attributes: [:review, :user_id, :id]) 
    end
end
