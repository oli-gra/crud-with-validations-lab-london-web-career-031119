class SongsController < ApplicationController
   begin
      @@n+1
   rescue
      @@n=1
   end

   def index
      @songs = Song.all
   end
   def show
      @song = Song.find(params[:id])
   end
   def new
      @instance = @@n
      @song = Song.new
   end
   def create
      song = Song.new(get_params)
      if song.valid?
         song.save
         redirect_to song_path song
      else
         @errors = song.errors.full_messages
         render :new
      end
   end
   def destroy
      song = Song.find(params[:id])
      song.delete
   end
   def edit
      @song = Song.find(params[:id])
   end
   def update
      song = Song.update(get_params)
      if song.valid?
         redirect_to song_path song
      else
         @errors = song.errors.full_messages
         render :edit
      end
   end
   private
   def get_params
      params.require(:song).permit(:title,:released,:release_year,:artist_name,:genre)
   end
end
