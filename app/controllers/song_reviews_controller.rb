class SongReviewsController < ApplicationController

    def new
        @song = Song.find(params[:song_id])
        @song_review = SongReview.new
    end

    def create
        @song = Song.find(params[:song_id])
        @song_review = SongReview.new(song_review_params)
        if @song_review.save
            redirect_to @song_review.song
        else
            puts ("THIS IS THE SONG: #{@song.id}")
            render :new
        end
    end

    def edit 
        @song = Song.find(params[:song_id])
        @song_review = SongReview.find(params[:id])
    end

    def update 
        @song_review = SongReview.find(params[:id])
        @song = @song_review.song
        if @song_review.update(song_review_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end
    
    def show
        @song_review = SongReview.find(params[:id])
        @song = Song.find(params[:id])
    end
    
    def destroy
        @song_review = SongReview.find(params[:id])
        if @song_review.destroy
            redirect_to root_path, :notice => "Your song has been deleted Successfully."
        else
            flash[:notice] = "warning"
            redirect_to @song_review.song
        end
    end

    private

    def song_review_params
        params.require(:song_review).permit(:user_id, :song_id, :review) 
    end
end
