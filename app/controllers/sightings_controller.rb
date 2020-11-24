class SightingsController < ApplicationController
    
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end
    
    
    
    def show
        # # [[IDs]] URL address below Renders a single json sighting object that has a bird and location IDs:   
        # #      http://localhost:3000/sightings/1
        # sighting = Sighting.find_by(id: params[:id])
        # render json: sighting


        # # [[OBJECTs]] URL address below Renders a single json sighting object that has bird and location OBJECTs:
        # #      http://localhost:3000/sightings/1
        # sighting = Sighting.find_by(id: params[:id])
        # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
        

        # [[OBJECTs]] URL address below uses "include" to Render a single json sighting object that has bird and location OBJECTs:
        #      http://localhost:3000/sightings/1
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting, include: [:bird, :location]


    end

end
