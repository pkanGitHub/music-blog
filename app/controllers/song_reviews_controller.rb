class SongReviewsController < ApplicationController
    before_action :set_song_review, only: [:edit, :update, :show, :destroy]
    before_action :set_song_id, only: [:new, :create, :edit]

    def new
        @song_review = SongReview.new
    end

    def create
        @song_review = SongReview.new(song_review_params)
        if @song_review.save
            redirect_to @song_review.song, notice: "review created successfully."
        else
            # puts ("THIS IS THE SONG: #{@song.id}")
            flash.now[:alert] = "Review was not created successfully."
            render :new
        end
    end

    def edit 
    end

    def update 
        @song = @song_review.song
        if @song_review.update(song_review_params)
            redirect_to song_path(@song), notice: "review has been updated successfully."
        else
            flash.now[:alert] = "review could NOT be updated."
            render :edit
        end
    end
    
    def show
        @song_review = @song.song_review.search_for_user_review(current_user)
    end
    
    def destroy
        if @song_review.destroy
            redirect_to root_path, :notice => "Your song has been deleted successfully."
        else
            flash.now[:notice] = "The song was NOT successfully deleted."
            redirect_to @song_review.song
        end
    end

    private

    def set_song_review
        @song_review = SongReview.find(params[:id])
    end

    def set_song_id
        @song = Song.find(params[:song_id])
    end

    def song_review_params
        params.require(:song_review).permit(:user_id, :song_id, :review) 
    end
end
