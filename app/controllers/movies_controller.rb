class MoviesController < ApplicationController
  def show
    if params[:search_by_name].present?
      @movie = Movie.find(params[:id])
      @new_actor = @movie.search_by_name_threshold(params[:search_by_name])
      @new_actor.update(movie_id: @movie.id)
      @actors = @movie.actors.order(age: :asc)
    else
      @movie = Movie.find(params[:id])
      @actors = @movie.actors.order(age: :asc)
    end
  end
end
