class MoviesController < ApplicationController

  def index 
    @all_movies = Movie.all
  end

  def show
    @a_movie = Movie.where(id: params[:id]).first 
  end

  def new
   
  end
  
end
