class ActorsController < ApplicationController

  def show
    @actor = Actor.find(params[:id])
    related = Actor.where(:movie_id => @actor.movie_id)
    @related_actors = related.where.not(:name => @actor.name)
  end
end
