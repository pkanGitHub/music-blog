class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    # def welcome
    #     # byebug
    # end


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end




#        user_song_song_reviews GET      /users/:user_id/songs/:song_id/song_reviews(.:format)                                    song_reviews#index
#                               POST     /users/:user_id/songs/:song_id/song_reviews(.:format)                                    song_reviews#create
#     new_user_song_song_review GET      /users/:user_id/songs/:song_id/song_reviews/new(.:format)                                song_reviews#new
#    edit_user_song_song_review GET      /users/:user_id/songs/:song_id/song_reviews/:id/edit(.:format)                           song_reviews#edit
#         user_song_song_review GET      /users/:user_id/songs/:song_id/song_reviews/:id(.:format)                                song_reviews#show
#                               PATCH    /users/:user_id/songs/:song_id/song_reviews/:id(.:format)                                song_reviews#update
#                               PUT      /users/:user_id/songs/:song_id/song_reviews/:id(.:format)                                song_reviews#update
#                               DELETE   /users/:user_id/songs/:song_id/song_reviews/:id(.:format)                                song_reviews#destroy
#                    user_songs GET      /users/:user_id/songs(.:format)                                                          songs#index
#                 new_user_song GET      /users/:user_id/songs/new(.:format)                                                      songs#new
#                edit_user_song GET      /users/:user_id/songs/:id/edit(.:format)                                                 songs#edit
#                     user_song GET      /users/:user_id/songs/:id(.:format)                                                      songs#show
#                         users GET      /users(.:format)                                                                         users#index
#                               POST     /users(.:format)                                                                         users#create
#                      new_user GET      /users/new(.:format)                                                                     users#new
#                     edit_user GET      /users/:id/edit(.:format)                                                                users#edit
#                          user GET      /users/:id(.:format)                                                                     users#show
#                               PATCH    /users/:id(.:format)                                                                     users#update
#                               PUT      /users/:id(.:format)                                                                     users#update
#                               DELETE   /users/:id(.:format)                                                                     users#destroy
#                         songs GET      /songs(.:format)                                                                         songs#index
#                               POST     /songs(.:format)                                                                         songs#create
#                      new_song GET      /songs/new(.:format)                                                                     songs#new
#                     edit_song GET      /songs/:id/edit(.:format)                                                                songs#edit
#                          song GET      /songs/:id(.:format)                                                                     songs#show
#                               PATCH    /songs/:id(.:format)                                                                     songs#update
#                               PUT      /songs/:id(.:format)                                                                     songs#update
#                          root GET      /                                                                                        song#index