class RatingsController < ApplicationController
  before_action :set_movie

  def create
    @rating=@movie.ratings.new(rating_params)
    redirect_to movie_path(@movie), notice: @rating.save ? "Rating saved successfully" : 'Please select any one of the Rating'
  end

  private

  def set_movie
    @movie=Movie.find(params[:movie_id])
  end

  def rating_params
    params.require(:rating).permit(:star, :movie_id)
  end
end
