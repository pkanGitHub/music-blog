class SongsController < ApplicationController


    def index
        my_songs = params[:my_songs]
        artist = params[:artist_name]
        if artist && artist != ''
            @songs = Song.filter_for_artist(artist)
        elsif my_songs
            @songs = current_user.songs
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
            flash[:alert] = "Song already exist!"
            render :new
        end
    end

    def show
        @song = Song.find(params[:id])

    end

    def edit
        @song = Song.find(params[:id])
        # if current_user 
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            # byebug
            redirect_to @song, notice: "The song info has been updated successfully."
        else
            # byebug
            Flash[:alert] = "The song was NOT updated successfully"
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        
        redirect_to root_path, notice: "The song has been successfully deleted"
    end

    private

    def song_params
        params.require(:song).permit(:artist_name, :title, :genre, :language, :link, :user_id, song_reviews_attributes: [:review, :user_id, :id]) 
    end
end
