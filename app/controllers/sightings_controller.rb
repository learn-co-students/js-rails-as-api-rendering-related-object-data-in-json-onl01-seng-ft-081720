class SightingsController < ApplicationController

  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
  end

  def show

    sighting = Sighting.find_by(id: params[:id])
    # render json: sighting
    # this creates nested objects in our renderedJSON for bird and location
    # render json: {id: sighting.id, bird: sighting.bird, location: sighting.location }
    # an alternative is to use include to indicate what models you want to nest
    # render json: sighting, include: [:bird, :location]
    # this produces a similar results as the above render
    # include can be used with only and except
    # if sighting
    #   render json: sighting.to_json(include: [:bird, :location])
    # else
    #   render json: {message: 'No sighting found with that id'}
    # end

    # to also remove all instances of :created_at and :updated_at from the nested bird and location data in the above example, we'd have to add nesting into the options, so the included bird and location data can have their own options listed. Using the fully written to_json render statement can help keep things a bit more readable here:
    render json: sighting.to_json(:include => {
    :bird => {:only => [:name, :species]},
    :location => {:only => [:latitude, :longitude]}
  }, :except => [:updated_at])
  end
end
