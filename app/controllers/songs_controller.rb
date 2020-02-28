class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        my_songs = params[:my_songs]
        artist = params[:artist_name]
        # set_find_artist_and_my_songs
        genre = params[:genre]

        if artist && artist != '' 
            @songs = Song.filter_for_artist(artist)
        elsif my_songs
            @songs = current_user.songs
        elsif genre
            @songs = Song.filter_by_genre(genre)
        else
            @songs = Song.all
        end
    end

    def new
        @song = Song.new
    end

    def create
        # byebug
        @song = Song.new(song_params)
        if @song.save
            redirect_to songs_path, notice: "Song was created successfully"
        else
            flash.now[:alert] = "Song already exist!"
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        if @song.update(song_params)
            # byebug
            redirect_to @song, notice: "The song info has been updated successfully."
        else
            # byebug
            flash.now[:alert] = "The song was NOT updated successfully"
            render :edit
        end
    end

    def destroy
        @song.destroy
        
        redirect_to root_path, notice: "The song has been successfully deleted"
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    # def set_find_artist_and_my_songs
    #     my_songs = params[:my_songs]
    #     artist = params[:artist_name]
    #     if artist && artist != '' 
    #         @songs = Song.filter_for_artist(artist)
    #     elsif my_songs
    #         @songs = current_user.songs
    #     else
    #         @songs = Song.all
    #     end
    # end

    def song_params
        params.require(:song).permit(:artist_name, :title, :genre, :language, :link, :user_id, song_reviews_attributes: [:review, :user_id, :id]) 
    end
end
