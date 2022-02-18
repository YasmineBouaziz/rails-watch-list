class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_param)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  private

  def movie_param
    params.require(:movie).permit(:name, :photo)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

end
